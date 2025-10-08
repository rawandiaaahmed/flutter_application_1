part of 'verify_cubit.dart';

sealed class VerifyState extends Equatable {
  @override
  List<Object> get props => [];
}

final class VerifyInitial extends VerifyState {}

final class VerifySuccess extends VerifyState {
  final String message;

  VerifySuccess({required this.message});
}

final class VerifyLouding extends VerifyState {}

final class VerifyFailure extends VerifyState {
  final String errmessage;

  VerifyFailure({required this.errmessage});
}
