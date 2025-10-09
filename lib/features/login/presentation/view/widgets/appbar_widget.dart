import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Icon(Icons.arrow_back, color: Color(0xFF212529), size: 25),
          ),
        ],
      ),
    );
  }
}
