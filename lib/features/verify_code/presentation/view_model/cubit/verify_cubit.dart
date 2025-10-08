import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/verify_code/data/model/verify_request_model.dart';

import 'package:flutter_application_1/features/verify_code/data/repo/verify_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit(this.verifyRepo) : super(VerifyInitial());
  final VerifyRepo verifyRepo;
  Future<void> verification({
    required String email,
    required String code,
  }) async {
    emit(VerifyLouding());
    final response = await verifyRepo.verify(
      VerifyRequestModel(email: email, code: code),
    );
    response.fold(
      (errMessage) => emit(VerifyFailure(errmessage: errMessage)),
      (verificationModel) =>
          emit(VerifySuccess(message: verificationModel.message)),
    );
  }
}
