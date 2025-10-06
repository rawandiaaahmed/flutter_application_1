import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/core/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/forget_password/presentation/view/widgets/header_forget_password_widget.dart';
import 'package:flutter_application_1/features/login/presentation/view/widgets/appbar_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(height: 20.h),
                AppbarWidget(),
                SizedBox(height: 8.h),
                HeaderForgetPasswordWidget(),
                SizedBox(height: 10.h),

                SizedBox(height: 10.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.email),
                  controller: emailController,
                  hintText: 'olivia@untitledui.com',
                  label: Text(AppStrings.email),
                ),

                SizedBox(height: 30.h),
                CustomButton(
                  text: AppStrings.resetPassword,
                  formKey: _formKey,
                  onValid: () {
                    context.pushNamed(StringRoute.verify);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
