import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/core/utils/styles.dart';

class ForgetPassController extends GetxController{

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();

  String?  email;
  bool isLoading = false;

  String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email Address must not be empty!';
    }
    return null;
  }

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      await AuthController.instance.forgetPass(emailController.text);

      isLoading = false;
      update();

      Get.snackbar(
        'Recovered',
        'Email has been sent to you',
        duration:  const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: kPrimaryColor,
        colorText: kForegroundColor,
      );
    }
  }

}