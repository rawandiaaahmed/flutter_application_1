import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/styles.dart';
import 'package:flutter_application_1/features/onboarding/data/model/onboarding_model.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view_model/Onboarding_cubit.dart';
import 'package:flutter_application_1/features/onboarding/presentation/view_model/Onboarding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController _controller = PageController();

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AssetManager.onboarding1,
      title: "Enjoy a paper-like reading experience,anytime,anywhere",
    ),
    OnboardingModel(
      image: AssetManager.onboarding2,
      title: "Buy your favorite books instantly with just a single tap",
    ),
    OnboardingModel(
      image: AssetManager.onboarding3,
      title: "Join community to share and discover new ideas",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (index) {
                      context.read<OnboardingCubit>().updatePage(index);
                    },
                    itemCount: pages.length,
                    itemBuilder: (_, index) {
                      final item = pages[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item.image),
                          SizedBox(height: 30.h),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Text(
                              item.title,

                              style: TextStyles.font20Medium.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _controller,
                        count: pages.length,
                        effect: const WormEffect(
                          //    dotColor: AppColors.primaryColor,
                          activeDotColor: AppColors.bottom,
                          dotHeight: 14,
                          dotWidth: 14,
                          spacing: 6,
                        ),
                      ),
                      Row(
                        children: [
                          if (state.pageIndex > 0)
                            TextButton(
                              onPressed: () {
                                context.read<OnboardingCubit>().previousPage();

                                _controller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                "Back",
                                style: TextStyles.font16SemiBold.copyWith(
                                  color: Color(0xFFB0B3B8),
                                ),
                              ),
                            ),
                          if (state.pageIndex > 0) SizedBox(width: 12.w),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(left: 8.h, right: 8.h),
                              backgroundColor: AppColors.bottom,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            onPressed: () {
                              if (state.pageIndex == pages.length - 1) {
                                context.pushNamed(StringRoute.login);
                              } else {
                                context.read<OnboardingCubit>().nextPage();
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10.h),
                              child: Text(
                                state.pageIndex == pages.length - 1
                                    ? "Get Started"
                                    : "Next",
                                style: TextStyles.font16SemiBold.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
