import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Text(
          'Turing',
          style: TextStyle(
              color: kBackgroundColor,
              fontSize: 50
          ),
        ),
      ),
    );;
  }
}
