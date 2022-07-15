import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/data/models/onboard.dart';

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
          //TODO: Notify Me
          AuthController.instance.onReady();
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
