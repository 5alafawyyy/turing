import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/profile/screens/view/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static String id = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: ProfileViewBody(),
    );
  }
}
