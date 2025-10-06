import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HeaderNewPassword extends StatelessWidget {
  const HeaderNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: SvgPicture.asset(AssetManager.password)),
        SizedBox(height: 16.h),
        Center(
          child: Text(
            AppStrings.newpassword,
            style: TextStyles.font20Medium.copyWith(
              fontSize: 22.sp,
              color: AppColors.solidGray900,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.newpassword2,
          style: TextStyles.font14regular.copyWith(
            color: AppColors.solidGray500,
          ),
        ),
        Text(
          AppStrings.newpassword3,
          style: TextStyles.font14regular.copyWith(
            color: AppColors.solidGray500,
          ),
        ),
      ],
    );
  }
}
