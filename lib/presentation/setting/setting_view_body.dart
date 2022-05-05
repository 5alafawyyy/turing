import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/constants/styles.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading:  IconButton(
          icon:  const Icon(Icons.arrow_back_ios, color: kSecondColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        backgroundColor: kMainColor,
        foregroundColor: kSecondColor,
        shadowColor: kMainColor,
        elevation: 8,
      ),
      body: const Center(

          child: Text(
            'Settings',
            style: TextStyle(
              color: kSecondColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),

      ),
    );
  }
}
