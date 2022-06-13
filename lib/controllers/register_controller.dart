import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/core/utils/styles.dart';

class RegisterController extends GetxController{

  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String?  email, password;
  bool isLoading = false;
  bool isClicked = true;

  // String? userValidate(String? value){
  //   if (value == null || value.isEmpty) {
  //     return 'Name must not be empty!';
  //   }
  //   return null;
  // }
  String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email Address must not be empty!';
    }
    return null;
  }
  String? passValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must not be empty!';
    }if (value.toString().length < 8) {
      return 'Password must be at least 8 characters!';
    }
    return null;
  }

  void isVisible(){
    isClicked =! isClicked;
    update();
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      // await Future.delayed(const Duration(seconds: 3));
      await AuthController.instance.register(emailController.text, passwordController.text);
      isLoading = false;
      update();
    }
  }

}