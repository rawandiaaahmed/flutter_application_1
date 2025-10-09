part of 'new_password_cubit.dart';

sealed class NewPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

final class NewPasswordInitial extends NewPasswordState {}

final class NewPasswordSuccess extends NewPasswordState {
  final String message;

  NewPasswordSuccess({required this.message});
}

final class NewPasswordFailure extends NewPasswordState {
  final String errMessage;

  NewPasswordFailure({required this.errMessage});
}

final class NewPasswordLouding extends NewPasswordState {}
