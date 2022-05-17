import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';

class CreateNewArticleController extends GetxController {


  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  GlobalKey<FormState> formKey = GlobalKey();
  void createArticle() {
    if (formKey.currentState!.validate()) {

      Get.back();
      Get.snackbar(
        'Your Article: ' + titleController.text,
        'published successfully',
        duration:  const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: kPrimaryColor,
        colorText: kForegroundColor,
      );
    }
    update();
  }
}
