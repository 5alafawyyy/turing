import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
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

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
  GlobalKey<FormState> formKey = GlobalKey();
  void createCommunity() {
    if (formKey.currentState!.validate()) {

      Get.back();
    }
    update();
  }
}
