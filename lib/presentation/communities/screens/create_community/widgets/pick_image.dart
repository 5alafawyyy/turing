import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/controllers/create_new_community_controller.dart';
import 'package:turing/presentation/communities/screens/create_community/widgets/popup.dart';

class PickImage extends StatelessWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateNewCommunityController>(
      init: CreateNewCommunityController(),
      builder: (controller) => GestureDetector(
        onTap:  controller.onTap,
        child: Container(
          width: double.infinity,
          height: 250.0,
          color: kPrimaryColor,
          child: Stack(
            alignment: AlignmentDirectional.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CreateNewCommunityController>(
                builder: (controller)=>
                controller.image == null ?
                const Text(
                  'Cover Image',
                  style: TextStyle(
                    color: kForegroundColor,
                    fontSize: 20.0,
                  ),
                )
                    :
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: kForegroundColor),
                  child: Image.file(
                    controller.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right:  0.0,
                child: customPopup(
                  key: controller.menuKey,
                  text1: 'Pick Image from Gallery',
                  text2: 'Pick Image from Camera',
                  onTap1: controller.galleryGetter,
                  onTap2: controller.cameraGetter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
