import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final GlobalKey<FormState>? formKey;
  final VoidCallback? onValid;

  const CustomButton({
    super.key,
    required this.text,
    this.formKey,
    this.onValid,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 328.w,
      height: 43.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(left: 10.h, right: 10.h),
          backgroundColor: AppColors.bottom,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        onPressed: () {
          if (formKey == null) {
            if (onValid != null) onValid!();
          } else {
            if (formKey!.currentState != null &&
                formKey!.currentState!.validate()) {
              if (onValid != null) onValid!();
            }
          }
        },
        child: Text(
          text,
          style: TextStyles.font16SemiBold.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
