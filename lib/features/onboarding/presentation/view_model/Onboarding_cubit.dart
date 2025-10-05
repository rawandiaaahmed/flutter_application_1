import 'package:flutter_application_1/features/onboarding/presentation/view_model/Onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(pageIndex: 0));
  void nextPage() {
    emit(OnboardingState(pageIndex: state.pageIndex + 1));
  }

  void previousPage() {
    if (state.pageIndex > 0) {
      emit(OnboardingState(pageIndex: state.pageIndex - 1));
    }
  }

  void updatePage(int index) {
    emit(OnboardingState(pageIndex: index));
  }

  void finishOnboarding() {}
}
