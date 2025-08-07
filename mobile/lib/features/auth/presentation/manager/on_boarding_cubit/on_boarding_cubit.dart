import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/onboarding_page_entity.dart';
import 'on_boarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final List<OnboardingPageEntity> pages;

  OnboardingCubit({required this.pages}) : super(const OnboardingState());

  void updatePageIndex(int index) {
    emit(state.copyWith(
      currentPage: index,
      isLastPage: index == pages.length - 1,
    ));
  }

  void nextPage() {
    final nextPage = state.currentPage + 1;
    if (nextPage >= pages.length) return;

    emit(state.copyWith(
      currentPage: nextPage,
      isLastPage: nextPage == pages.length - 1,
    ));
  }

  void skipToEnd() {
    emit(state.copyWith(
      currentPage: pages.length - 1,
      isLastPage: true,
    ));
  }
}