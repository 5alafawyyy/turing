import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RoomController extends GetxController{
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  get refreshController => _refreshController;


final TextEditingController _newRoomTitleController = TextEditingController();
get newRoomTitleController => _newRoomTitleController;

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  GlobalKey<FormState> formKey = GlobalKey();
  void createRoom() {
    if (formKey.currentState!.validate()) {
      //TODO: write code to start new room here

      Get.back();
    }
    update();
  }


}
