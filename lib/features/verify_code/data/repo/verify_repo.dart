import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/errors/exceptions.dart';
import 'package:flutter_application_1/core/network/api_consumer.dart';
import 'package:flutter_application_1/core/network/end_ponits.dart';
import 'package:flutter_application_1/features/verify_code/data/model/verify_request_model.dart';
import 'package:flutter_application_1/features/verify_code/data/model/verify_response_model.dart';

class VerifyRepo {
  final ApiConsumer api;
  VerifyRepo({required this.api});
  Future<Either<String, VerifyResponseModel>> verify(
    VerifyRequestModel request,
  ) async {
    try {
      final response = await api.post(
        EndPoint.verfication,

        data: request.toJson(),
      );
      final verficationModel = VerifyResponseModel.fromJson(response);
      return Right(verficationModel);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
