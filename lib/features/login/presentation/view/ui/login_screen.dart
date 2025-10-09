import 'package:flutter/material.dart';

import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';

import 'package:flutter_application_1/core/theme/app_string.dart';

import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/core/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/login/presentation/view/widgets/forget_password_widget.dart';
import 'package:flutter_application_1/features/login/presentation/view/widgets/header_widget.dart';
import 'package:flutter_application_1/features/login/presentation/view/widgets/login_widget.dart';
import 'package:flutter_application_1/features/login/presentation/view_model/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                SizedBox(height: 78.h),
                HeaderWidget(),
                SizedBox(height: 10.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.email),
                  controller: emailController,
                  hintText: 'olivia@untitledui.com',
                  label: Text(AppStrings.email),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.password),
                  controller: passwordController,
                  hintText: '************',
                  label: Text(AppStrings.password),
                  isPassword: true,
                ),

                ForgetPasswordWidget(),
                SizedBox(height: 12.h),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Login Success',
                            style: TextStyle(color: AppColors.bottom),
                          ),
                          backgroundColor: AppColors.white,
                        ),
                      );
                    } else if (state is LoginFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      text: AppStrings.signIn,
                      formKey: _formKey,
                      onValid: () {
                        context.read<LoginCubit>().login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: 50.h),
                LoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
