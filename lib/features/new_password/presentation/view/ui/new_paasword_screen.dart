import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/core/widgets/custom_text_field.dart';
import 'package:flutter_application_1/features/login/presentation/view/widgets/appbar_widget.dart';

import 'package:flutter_application_1/features/new_password/presentation/view/widgets/header_new_password.dart';
import 'package:flutter_application_1/features/new_password/presentation/view_model/cubit/new_password_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewPaaswordScreen extends StatefulWidget {
  NewPaaswordScreen({super.key, required this.email});
  final String email;

  @override
  State<NewPaaswordScreen> createState() => _NewPaaswordScreenState();
}

class _NewPaaswordScreenState extends State<NewPaaswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController currentpasswordController =
      TextEditingController();

  @override
  void dispose() {
    confirmpasswordController.dispose();
    newpasswordController.dispose();
    currentpasswordController.dispose();
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
                SizedBox(height: 20.h),
                AppbarWidget(),
                SizedBox(height: 8.h),
                HeaderNewPassword(),
                SizedBox(height: 10.h),

                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.password),
                  controller: currentpasswordController,
                  hintText: '************',
                  label: Text(AppStrings.currentPassword),
                  isPassword: true,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.password),
                  controller: newpasswordController,
                  hintText: '************',
                  label: Text(AppStrings.newPassword),
                  isPassword: true,
                ),
                SizedBox(height: 10.h),
                CustomTextField(
                  prefixIcon: SvgPicture.asset(AssetManager.password),
                  controller: confirmpasswordController,
                  hintText: '************',
                  label: Text(AppStrings.confirmNewPassword),
                  isPassword: true,
                ),

                SizedBox(height: 32.h),
                BlocConsumer<NewPasswordCubit, NewPasswordState>(
                  listener: (context, state) {
                    if (state is NewPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message,
                            style: TextStyle(color: AppColors.bottom),
                          ),
                          backgroundColor: AppColors.white,
                        ),
                      );
                      context.pushNamed(StringRoute.passwordSuccess);
                    } else if (state is NewPasswordFailure) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.errMessage)));
                    }
                  },
                  builder: (context, state) {
                    if (state is NewPasswordLouding) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      text: AppStrings.confirm,
                      formKey: _formKey,
                      onValid: () {
                        context.read<NewPasswordCubit>().newPassword(
                          currentPassword: currentpasswordController.text,
                          confirmNewPassword: confirmpasswordController.text,
                          newPassword: newpasswordController.text,
                        );
                      },
                    );
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
