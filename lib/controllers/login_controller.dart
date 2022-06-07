import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turing/controllers/control_view.dart';

class LoginController extends GetxController{


  late SharedPreferences prefs;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? email, password;
  bool isLoading = false;
  bool isClicked = true;


  @override
  void onInit() async{
     prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

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

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      await Future.delayed(const Duration(seconds: 3));
      isLoading =false;
      await prefs.setBool("loginSuccess", true);
      Get.offAllNamed(ControlView.id);
      update();

      //TODO: Implementation of Login with api

    }
  }

}