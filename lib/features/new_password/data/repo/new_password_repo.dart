import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/features/new_password/data/model/new_password_request.dart';
import 'package:flutter_application_1/features/new_password/data/model/new_password_response_model.dart';

class NewPasswordRepo {
  final ApiConsumer api;
  NewPasswordRepo({required this.api});
  Future<Either<String, NewPasswordResponseModel>> newpassword(
    NewPasswordRequestModel request,
  ) async {
    try {
      final response = await api.post(
        EndPoint.newpassword,

        data: request.toJson(),
      );
      final newPasswordModel = NewPasswordResponseModel.fromJson(response);
      return Right(newPasswordModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
