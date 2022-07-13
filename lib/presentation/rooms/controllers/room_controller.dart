import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:turing/controllers/authController.dart';

import '../../../core/utils/data.dart';

class RoomController extends GetxController{
  static RoomController instance = RoomController();
  final collection = FirebaseFirestore.instance.collection('chatRooms');
  final FirebaseAuth auth = FirebaseAuth.instance;

  final RefreshController refreshController = RefreshController(initialRefresh: false);


final TextEditingController newRoomTitleController = TextEditingController();


  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  GlobalKey<FormState> formKey = GlobalKey();
  Future<void> createRoom() async {
    if (formKey.currentState!.validate()) {
      // Add new data to Firestore collection
      await collection.add(
        {
          'title': '${newRoomTitleController.text}',
          'author': AuthController.instance.currentData.displayName,
          'authorImage': AuthController.instance.currentData.displayName,
          'users': [profileData],
          'speakerCount': 1
        },
      );
    }
    update();
  }


}
