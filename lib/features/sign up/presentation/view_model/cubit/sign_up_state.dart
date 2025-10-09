part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
