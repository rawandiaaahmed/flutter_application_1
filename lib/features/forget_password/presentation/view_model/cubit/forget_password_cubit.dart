import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/forget_password/data/model/forget_password_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/features/forget_password/data/repo/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.forgetPasswordRepo) : super(ForgetPasswordInitial());
  final ForgetPasswordRepo forgetPasswordRepo;
  Future<void> forget({required String email}) async {
    emit(ForgetPasswordLoading());
    final response = await forgetPasswordRepo.forget(
      ForgetPasswordRequestModel(email: email),
    );
    response.fold(
      (errMessage) => emit(ForgetPasswordFailure(errMessage: errMessage)),
      (forgetpasswordmodel) =>
          emit(ForgetPasswordSuccess(message: forgetpasswordmodel.message)),
    );
  }
}
