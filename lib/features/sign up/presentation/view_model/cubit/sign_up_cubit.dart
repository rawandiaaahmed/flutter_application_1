import 'package:equatable/equatable.dart';

import 'package:flutter_application_1/features/sign%20up/data/model/sign_up_request_model.dart';
import 'package:flutter_application_1/features/sign%20up/data/repo/sign_up_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());
  final SignUpRepo signUpRepo;
  Future<void> signUp({
    required String firstName,
    required String phone,
    required String email,
    required String password,
    required String lastName,
  }) async {
    emit(SignUpLoading());
    final response = await signUpRepo.signUp(
      SignUpRequestModel(
        firstName: firstName,
        phone: phone,
        email: email,
        password: password,
        lastName: lastName,
      ),
    );
    response.fold(
      (errMessage) => emit(SignUpFailure(errMessage: errMessage)),
      (signUpModel) => emit(SignUpSuccess(message: signUpModel.message)),
    );
  }
}
