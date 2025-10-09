import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/helper/cache_helper.dart';
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/features/login/data/model/login_request_model.dart';
import 'package:flutter_application_1/features/login/data/model/login_response_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LoginRepo {
  final ApiConsumer api;
  LoginRepo({required this.api});
  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel requst,
  ) async {
    try {
      final response = await api.post(EndPoint.signIn, data: requst.toJson());
      final user = LoginResponseModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.accessToken);
      CacheHelper().saveData(key: ApiKey.token, value: user.accessToken);
      CacheHelper().saveData(key: ApiKey.id, value: decodedToken[ApiKey.sup]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
