import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityDetailsController extends GetxController {
  final GlobalKey menuKey = GlobalKey();

  int childCount = 1;
  String statusText = 'Closed';
  int peopleNumber = 650;
// check if closed / open status community


  /// join to community


  bool joined = false;
  void join(){
    joined = true;
    update();
  }


  TextEditingController newPost = TextEditingController();

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  GlobalKey<FormState> formKey = GlobalKey();
  void createPost() {
    if (formKey.currentState!.validate()) {

    }
    update();
  }


}
