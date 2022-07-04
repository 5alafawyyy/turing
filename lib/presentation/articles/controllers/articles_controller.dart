import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController{

  final GlobalKey menuKey = GlobalKey();


  // List articles = [];
  // late int articlesLength;
  // CollectionReference articlesRef = FirebaseFirestore.instance.collection("articles");


  //
  // @override
  // void onInit() {
  //   getData();
  //   super.onInit();
  // }



  // getData() async {
  //   var responseBody = await articlesRef.get();
  //   responseBody.docs.forEach((element) {
  //     articles.add(element.data());
  //     update();
  //   });
  //   articlesLength = articles.length;
  // }



  // bool isLoved = false;
  // Future<void> loveArticle()async {
  //   isLoved = !isLoved;
  //   update();
  // }
}