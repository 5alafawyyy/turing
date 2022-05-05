import 'package:get/get.dart';
import 'package:flutter/material.dart';
class DrawerControllerView extends GetxController{
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    update();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
    update();
  }
}