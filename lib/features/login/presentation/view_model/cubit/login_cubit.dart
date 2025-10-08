import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/features/login/data/model/login_request_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    final response = await loginRepo.login(
      LoginRequestModel(email: email, password: password),
    );
    response.fold(
      (errMessage) => emit(LoginFailure(errMessage: errMessage)),
      (signInModel) => emit(LoginSuccess(message: signInModel.message)),
    );
  }
}
