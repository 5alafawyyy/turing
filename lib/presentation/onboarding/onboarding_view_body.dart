import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/data/models/onboard.dart';
import 'package:turing/presentation/auth/login/login_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: OverBoard(
        allowScroll: true,
        pages: onboardPages,
        showBullets: true,
        buttonColor: kForegroundColor,
        inactiveBulletColor: kSecondaryColor,
        activeBulletColor: kForegroundColor,
        finishCallback: () {
          Get.offNamed(LoginView.id);
          ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Intro Finished"),
              ],
            ),
            backgroundColor: kPrimaryColor,

          ),
          );
        },
      ),
    );
  }
}
