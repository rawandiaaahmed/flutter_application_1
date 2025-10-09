import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/theme/styles.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyhaveanaccount,
          style: TextStyles.font14Medium.copyWith(
            color: AppColors.solidGray900,
          ),
        ),

        InkWell(
          onTap: () {
            context.pushNamed(StringRoute.login);
          },
          child: Text(
            AppStrings.signin,
            style: TextStyles.font14SemiBold.copyWith(
              color: AppColors.maaincolor,
            ),
          ),
        ),
      ],
    );
  }
}
