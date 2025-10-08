part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

final class LoginSuccess extends LoginState {
  final String message;

  LoginSuccess({required this.message});
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}
