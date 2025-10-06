import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';

import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/core/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/login/presentation/view/widgets/appbar_widget.dart';

import 'package:flutter_application_1/features/sign%20up/presentation/view/widgets/header_sign_up_widget.dart';
import 'package:flutter_application_1/features/sign%20up/presentation/view/widgets/phone_number_widget.dart';
import 'package:flutter_application_1/features/sign%20up/presentation/view/widgets/sign_up_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
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
                HeaderSignUpWidget(),
                SizedBox(height: 10.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.name),
                  controller: name,
                  hintText: 'olivia ahmed',
                  label: Text(AppStrings.name),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.email),
                  controller: emailController,
                  hintText: 'olivia@untitledui.com',
                  label: Text(AppStrings.email),
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.password),
                  controller: passwordController,
                  hintText: '************',
                  label: Text(AppStrings.password),
                  isPassword: true,
                ),
                SizedBox(height: 10.h),
                PhoneNumberWidget(controller: phone),
                SizedBox(height: 30.h),
                CustomButton(
                  text: AppStrings.signup,
                  formKey: _formKey,
                  onValid: () {},
                ),
                SizedBox(height: 30.h),
                SignUpWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
