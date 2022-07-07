import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turing/controllers/authController.dart';
import '../../../../../controllers/communities_controller.dart';
import '../../../../../core/utils/styles.dart';

class CommunityDetailsController extends GetxController {
  final GlobalKey menuKey = GlobalKey();
  late SharedPreferences prefs;

  static CommunityDetailsController instance = CommunityDetailsController();

  //   Add Document ID to take collection references
  late String docId;
  void setDocId(String id) {
    docId = id;
    update();
  }

  addPost(String postBody) async {
    CollectionReference postRef = FirebaseFirestore.instance
        .collection('communities')
        .doc('$docId')
        .collection('posts');
    postRef.add({
      'body': postBody,
      'createdBy': AuthController.instance.currentData.uid,
      'displayName': AuthController.instance.currentData.displayName,
      'noComments': 0,
      'noLikes': 0,
      'photoUrl': AuthController.instance.currentData.photoUrl,
      'createdAt': DateTime.now(),
    });
    print(postRef.toString());
  }

  String accessPost = '';
  var postRefComments;
  String? postId;
  var postRef;
  setPostId(String id) async {
    postId = id;
    postRef = await FirebaseFirestore.instance
        .collection('communities')
        .doc(docId)
        .collection('posts')
        .doc(postId);
    postRefComments = await postRef.collection('comments');
    update();
  }

  addComment(String id,String commentBody) async {

    print(postId);
    await FirebaseFirestore.instance
        .collection('communities')
        .doc(docId)
        .collection('posts')
        .doc(id)
        .collection('comments')
        .add({
      'body': commentBody,
      'createdBy': AuthController.instance.currentData.uid,
      'displayName': AuthController.instance.currentData.displayName,
      'photoUrl': AuthController.instance.currentData.photoUrl,
      'createdAt': DateTime.now(),
    });
    postRefComments.add({
      'body': commentBody,
      'createdBy': AuthController.instance.currentData.uid,
      'displayName': AuthController.instance.currentData.displayName,
      'photoUrl': AuthController.instance.currentData.photoUrl,
      'createdAt': DateTime.now(),
    });

  }

  TextEditingController newComment = TextEditingController();

  GlobalKey<FormState> formKey1 = GlobalKey();
  void createComment( String id) async {
    if (formKey1.currentState!.validate()) {
      addComment(id, newComment.text);
      Get.snackbar(
        'Feed',
        'Comment published',
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: kPrimaryColor,
        colorText: kForegroundColor,
      );
      newComment.clear();
    }else {
      Get.snackbar(
        'Feed',
        'Failed to comment',
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: kPrimaryColor,
        colorText: kForegroundColor,
      );
    }
    update();
  }

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
  }

  /// join to community
  bool joined = false;
  Future<void> join() async {
    joined = !joined;
    await prefs.setBool('joined', joined);
    update();
  }

  /// Enter to community
  bool enter = false;
  void enterCommunity() {
    enter = !enter;
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

  void createPost() async {
    if (formKey.currentState!.validate()) {
      await addPost(newPost.text);
      Get.snackbar(
        'Feed',
        'Post published successfully',
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: kPrimaryColor,
        colorText: kForegroundColor,
      );
      newPost.clear();
    } else {
      Get.snackbar(
        'Feed',
        'Failed to post',
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: kPrimaryColor,
        colorText: kForegroundColor,
      );
    }
    update();
  }

  bool likePress = false;
  likePressed() {
    likePress = !likePress;
    update();
  }
}
