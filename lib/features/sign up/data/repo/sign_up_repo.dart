import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/features/sign%20up/data/model/sign_up_request_model.dart';
import 'package:flutter_application_1/features/sign%20up/data/model/sign_up_response_model.dart';

class SignUpRepo {
  final ApiConsumer api;
  SignUpRepo({required this.api});
  Future<Either<String, SignUpResponsModel>> signUp(
    SignUpRequestModel request,
  ) async {
    try {
      final response = await api.post(EndPoint.signUp, data: request.toJson());
      final signUPModel = SignUpResponsModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
