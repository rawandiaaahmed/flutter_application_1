import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/new_password/data/model/new_password_request.dart';

import 'package:flutter_application_1/features/new_password/data/repo/new_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit(this.newPasswordRepo) : super(NewPasswordInitial());
  final NewPasswordRepo newPasswordRepo;
  Future<void> newPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(NewPasswordLouding());
    final response = await newPasswordRepo.newpassword(
      NewPasswordRequestModel(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );
    response.fold(
      (errMessage) => emit(NewPasswordFailure(errMessage: errMessage)),
      (newPasswordModel) =>
          emit(NewPasswordSuccess(message: newPasswordModel.message)),
    );
  }
}
