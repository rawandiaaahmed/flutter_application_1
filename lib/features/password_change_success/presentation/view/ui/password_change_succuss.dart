import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/theme/styles.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordChangeSuccuss extends StatelessWidget {
  const PasswordChangeSuccuss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 200.h),
            Center(child: Image.asset(AssetManager.passwordsuccess)),
            SizedBox(height: 20.h),
            Text(
              AppStrings.passwordChanged,
              style: TextStyles.font20Medium.copyWith(
                fontSize: 22.sp,
                color: AppColors.solidGray900,
              ),
            ),

            SizedBox(height: 8.h),
            Text(
              AppStrings.passwordChanged2,
              style: TextStyles.font14regular.copyWith(
                color: AppColors.solidGray500,
              ),
            ),
            Text(
              AppStrings.passwordChanged3,
              style: TextStyles.font14regular.copyWith(
                color: AppColors.solidGray500,
              ),
            ),
            SizedBox(height: 50.h),
            CustomButton(
              text: AppStrings.login,
              onValid: () {
                context.pushNamed(StringRoute.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
