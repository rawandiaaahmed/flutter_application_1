import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderSignUpWidget extends StatelessWidget {
  const HeaderSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            AppStrings.createAccount,
            style: TextStyles.font20Medium.copyWith(
              fontSize: 22.sp,
              color: AppColors.solidGray900,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.signup2,
          style: TextStyles.font14regular.copyWith(
            color: AppColors.solidGray500,
          ),
        ),
        Text(
          AppStrings.signup3,
          style: TextStyles.font14regular.copyWith(
            color: AppColors.solidGray500,
          ),
        ),
      ],
    );
  }
}
