import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommunitiesControllerCloud extends GetxController{
  static CommunitiesControllerCloud instance = Get.find();


  CollectionReference communitiesRef = FirebaseFirestore.instance.collection("communities") ;
  CollectionReference usersRef =  FirebaseFirestore.instance.collection("userData");





}

