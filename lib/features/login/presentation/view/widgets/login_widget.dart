import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/theme/styles.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontaccount,
          style: TextStyles.font14Medium.copyWith(
            color: AppColors.solidGray900,
          ),
        ),

        InkWell(
          onTap: () {
            context.pushNamed(StringRoute.signup);
          },
          child: Text(
            AppStrings.signup,
            style: TextStyles.font14SemiBold.copyWith(
              color: AppColors.maaincolor,
            ),
          ),
        ),
      ],
    );
  }
}
