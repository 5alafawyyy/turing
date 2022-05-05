import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/constants/styles.dart';
import 'package:turing/presentation/auth/login/login_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: MaterialButton(
          onPressed: () { Get.offAllNamed(LoginView.id); },
          child: Text(
            'Logout',
            style: TextStyle(
              color: kSecondColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: lightColor,
        ),
      ),
    );
  }
}
