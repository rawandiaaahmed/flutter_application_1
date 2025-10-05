import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Router/route_string.dart';
import 'package:flutter_application_1/core/constants/asset_manager.dart';

import 'dart:async';

import 'package:flutter_application_1/core/extensions/extention_navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      context.pushReplacementNamed(StringRoute.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AssetManager.splash, width: 170.w)),
    );
  }
}
