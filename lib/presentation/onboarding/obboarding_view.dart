import 'package:flutter/material.dart';
import 'package:turing/presentation/onboarding/onboarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  static String id = '/onBoarding';
  @override
  Widget build(BuildContext context) {
    return OnBoardingViewBody();
  }
}
