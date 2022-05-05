import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';
import 'package:turing/core/constants/styles.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/onboarding/models/onboard.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: OverBoard(
        allowScroll: true,
        pages: onboardPages,
        showBullets: true,
        buttonColor: kSecondColor,
        inactiveBulletColor: lightColor,
        activeBulletColor: darkColor,
        // backgroundProvider: NetworkImage('https://picsum.photos/720/1280'),
        // skipCallback: () {
        //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   //   content: Text("Skip clicked"),
        //   // ));
        // },
        finishCallback: () {
          Get.offNamed(LoginView.id);

          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text("Finish clicked"),

        },
      ),
    );
  }
}
