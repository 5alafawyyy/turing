import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/auth/login/login_view.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading:  IconButton(
          icon:  const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
        ),
        centerTitle: false,
        backgroundColor: kBackgroundColor,
        foregroundColor: kPrimaryColor,
        shadowColor: kBackgroundColor,
        elevation: 8,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () { Get.offAllNamed(LoginView.id); },
          child: const Text(
            'Logout',
            style: TextStyle(
              color: kBackgroundColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
