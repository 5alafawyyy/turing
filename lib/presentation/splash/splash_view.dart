import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/control_view.dart';
import 'package:turing/main.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/onboarding/obboarding_view.dart';
import 'package:turing/presentation/splash/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  static String id = '/';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay(){
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }
  _goNext(){
    // onboardScreen == 0 || onboardScreen == null ? Get.offNamed(OnBoardingView.id) : (isLoginSuccess ==false || isLoginSuccess == null ? Get.offNamed(LoginView.id) :Get.offAllNamed(ControlView.id));

  }

  @override
  void initState(){
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return  const SplashViewBody();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
