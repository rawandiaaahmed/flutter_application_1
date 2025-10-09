import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/new_password/data/model/new_password_request.dart';

import 'package:flutter_application_1/features/new_password/data/repo/new_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit(this.newPasswordRepo) : super(NewPasswordInitial());
  final NewPasswordRepo newPasswordRepo;
  Future<void> newPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(NewPasswordLouding());
    final response = await newPasswordRepo.newpassword(
      NewPasswordRequestModel(
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
        currentPassword: currentPassword,
      ),
    );
    response.fold(
      (errMessage) => emit(NewPasswordFailure(errMessage: errMessage)),
      (newPasswordModel) =>
          emit(NewPasswordSuccess(message: newPasswordModel.message)),
    );
  }
}
