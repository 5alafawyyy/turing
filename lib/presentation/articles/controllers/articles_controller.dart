import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController{

  final GlobalKey menuKey = GlobalKey();
  int childCount = 1;


  bool isLoved = false;

  void loveArticle(){
    isLoved = !isLoved;
    update();
  }
}