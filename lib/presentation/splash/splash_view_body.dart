import 'package:flutter/material.dart';
import 'package:turing/core/constants/styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kSecondColor,
      body: Center(
        child: Text(
          'Turing',
          style: TextStyle(
              color: kMainColor,
              fontSize: 50
          ),
        ),
      ),
    );;
  }
}
