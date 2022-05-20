import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{

  var _image;
  var imagePicker;

  @override
  void onInit() {
    imagePicker = ImagePicker();
    super.onInit();
  }

  // only camera
  void cameraGetter() async {
    XFile image = await imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    _image = File(image.path);
    update();
  }

  // only gallery
  void galleryGetter() async {
    XFile image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    _image = File(image.path);
    update();
  }

  get image => _image;


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();



  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  void updateProfile() {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      // Get.back();
    }
    update();
  }

}
