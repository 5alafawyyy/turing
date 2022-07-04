import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';

class CreateNewArticleController extends GetxController {

  CollectionReference articlesRef = FirebaseFirestore.instance.collection("articles");
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  GlobalKey<FormState> formKey = GlobalKey();
  void createArticle() async{
    if (formKey.currentState!.validate()) {

      articlesRef.add({
        "title": titleController.text,
        "desc" : descController.text,
        "author" : auth.currentUser!.displayName,
        "id": auth.currentUser!.uid,
        "likes" : 0,
      });

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
