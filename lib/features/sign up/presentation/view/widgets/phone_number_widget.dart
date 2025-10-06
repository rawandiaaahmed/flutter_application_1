// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';

class PhoneNumberWidget extends StatelessWidget {
  PhoneNumberWidget({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.phonenumber),
        SizedBox(width: 2.w),
        SizedBox(
          width: 342.w,
          child: IntlPhoneField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'phone number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Color(0xffD0D5DD),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
            ),
            initialCountryCode: 'EG',
            onChanged: (phone) {},
          ),
        ),
      ],
    );
  }
}
