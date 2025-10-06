import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.h),
        child: InkWell(
          onTap: () {
            context.pushNamed(StringRoute.forget);
          },
          child: Text(
            AppStrings.forgotPassword,
            style: TextStyles.font13Bold.copyWith(
              color: AppColors.solidGray800,
            ),
          ),
        ),
      ),
    );
  }
}
