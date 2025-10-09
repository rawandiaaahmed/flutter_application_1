import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/features/forget_password/data/model/forget_paasword_response_model.dart';
import 'package:flutter_application_1/features/forget_password/data/model/forget_password_request_model.dart';

class ForgetPasswordRepo {
  final ApiConsumer api;
  ForgetPasswordRepo({required this.api});
  Future<Either<String, ForgetPaaswordResponseModel>> forget(
    ForgetPasswordRequestModel request,
  ) async {
    try {
      final response = await api.post(
        EndPoint.resentEmail,
        data: request.toJson(),
      );
      final forgetPaasword = ForgetPaaswordResponseModel.fromJson(response);
      return right(forgetPaasword);
    } on ServerException catch (e) {
      return left(e.errModel.message);
    }
  }
}
