import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:turing/controllers/authController.dart';

class ProfileController extends GetxController {
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

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }


  Future<String> uploadFile(File image) async {
    String downloadURL;
    String postId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("photoUrl")
        .child("post_$postId.jpg");
    await ref.putFile(image);
    downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  late String url;
  uploadToFirebase() async {
    isLoading = true;
    url = await uploadFile(_image);
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(AuthController.instance.auth.currentUser?.uid)
        .update({'photoUrl': url});
    await AuthController.instance.getUserData();
    isLoading = false;
    update();
  }
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  void updateProfile() async{
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      Get.back();
      await uploadToFirebase();
      AuthController.instance.updateUserData(
        currentUser: AuthController.instance.auth.currentUser!,
        displayName: nameController.text,
        photoUrl: url,
        email: emailController.text,
      );
      await AuthController.instance.getUserData();
      isLoading = false;

      update();
    }


  }
}
