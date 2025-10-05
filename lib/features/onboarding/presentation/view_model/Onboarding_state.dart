import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int pageIndex;

  const OnboardingState({this.pageIndex = 0});

  @override
  List<Object?> get props => [pageIndex];
}
