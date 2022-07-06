import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:turing/controllers/communities_controller.dart';
import 'package:turing/presentation/communities/screens/create_community/widgets/image_from_gallery.dart';

enum ImageSourceType { gallery, camera }

class CreateNewCommunityController extends GetxController {
  final GlobalKey _menuKey = GlobalKey();

  var _type;
  var _image;
  var imagePicker;

  @override
  void onInit() {
    imagePicker = ImagePicker();
    super.onInit();
  }

  // ImageSourceType _sourceTypeGallery (){
  //   return ImageSourceType.gallery;
  // }
  // get sourceTypeGallery => _sourceTypeGallery();
  //
  // ImageSourceType _sourceTypeCamera (){
  //   return ImageSourceType.camera;
  // }
  // get sourceTypeCamera => _sourceTypeCamera();
  //
  // void _handleURLButtonPress(BuildContext context, var type) {
  //   Get.to(ImageFromGalleryEx(type));
  //   _type = type;
  // }
  //
  // get handleURLButtonPress => _handleURLButtonPress;
  // get type => _type;
  //
  //
  // void _imageGetter() async {
  //   var source = type == ImageSourceType.camera
  //       ? ImageSource.camera
  //       : ImageSource.gallery;
  //   XFile image = await imagePicker.pickImage(
  //       source: source, imageQuality: 50, preferredCameraDevice: CameraDevice.front
  //   );
  //   _image = File(image.path);
  //   Get.back();
  //   update();
  // }
  // get imageGetter => _imageGetter;

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

  // Menu Opener
  dynamic state;

  void _onTap() {
    state = _menuKey.currentState;
    state.showButtonMenu();
  }

  get menuKey => _menuKey;

  get onTap => _onTap;


  // upload image to firebase storage
  Future<String> uploadFile(File image) async {
    String downloadURL;
    String communityId = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("communitiesPhotos")
        .child("community_$communityId.jpg");

    await ref.putFile(image);
    downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  bool isLoading = false;

  String? url;

  uploadToFirebase() async {
    url = await uploadFile(_image);
    update();
  }


  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  bool isSwitch = false;

  void changeSwitch(isSwitched){
    isSwitch = isSwitched;
    update();
  }

  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  GlobalKey<FormState> formKey = GlobalKey();

  void createCommunity() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      print(url);
      url == null ? await Duration(milliseconds: 500) : await uploadToFirebase();
      CommunitiesControllerCloud.instance.communitiesRef.add({
        'titleText': titleController.text,
        'description': descController.text,
        'imgUrl': url == null ?  'https://firebasestorage.googleapis.com/v0/b/turing-d92dd.appspot.com/o/communitiesPhotos%2Fno-image.png?alt=media&token=7108be3d-34ed-4929-9116-40c0c78c25e6' : url,
        'isOpened': isSwitch,
        'noMembers': 0,
      });

      isLoading = false;
      Get.back();

      update();
    }
  }
}

