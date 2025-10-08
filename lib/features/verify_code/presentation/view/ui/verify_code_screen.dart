import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_string.dart';
import 'package:flutter_application_1/core/theme/styles.dart';
import 'package:flutter_application_1/core/widgets/custom_button.dart';
import 'package:flutter_application_1/features/login/presentation/view/widgets/appbar_widget.dart';
import 'package:flutter_application_1/features/verify_code/presentation/view/widgets/header_verify_code.dart';
import 'package:flutter_application_1/features/verify_code/presentation/view_model/cubit/verify_cubit.dart';

class VerifyCodeScreen extends StatefulWidget {
  VerifyCodeScreen({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController pinController = TextEditingController();

  int seconds = 46;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (mounted && seconds > 0) {
        setState(() {
          seconds--;
        });
        _startTimer();
      }
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60.w,
      height: 60.h,
      textStyle: TextStyles.font20SemiBold,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.maaincolor),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              SizedBox(height: 20.h),
              AppbarWidget(),
              SizedBox(height: 8.h),
              HeaderVerifyCode(),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {
                  seconds == 0
                      ? () {
                          setState(() {
                            seconds = 46;
                            _startTimer();
                          });
                        }
                      : null;
                },
                child: Text(
                  "00:${seconds.toString().padLeft(2, '0')}",
                  style: TextStyles.font20Medium.copyWith(
                    color: AppColors.solidGray900,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: Pinput(
                  controller: pinController,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,

                  onCompleted: (pin) {
                    pinController.text = pin;
                  },
                ),
              ),

              SizedBox(height: 30.h),
              BlocConsumer<VerifyCubit, VerifyState>(
                listener: (context, state) {
                  if (state is VerifySuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.message,
                          style: TextStyle(color: AppColors.bottom),
                        ),
                        backgroundColor: AppColors.white,
                      ),
                    );
                  } else if (state is VerifyFailure) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errmessage)));
                  }
                },
                builder: (context, state) {
                  if (state is VerifyLouding) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomButton(
                    text: AppStrings.verify,

                    onValid: () {
                      context.read<VerifyCubit>().verification(
                        email: widget.email,
                        code: pinController.text,
                      );
                      context.pushNamed(StringRoute.newpassword);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
