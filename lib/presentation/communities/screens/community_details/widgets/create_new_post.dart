import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/communities/screens/community_details/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/new_post_text_field.dart';

Widget createNewPost (){
  CommunityDetailsController controller = Get.put(CommunityDetailsController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15),
    child: Row(
      children:  [
        const CircleAvatar(
            radius: 18.0,
            backgroundImage: AssetImage(
              'assets/images/ahmedkhallaf.jpeg',
            ),
          ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: GetBuilder<CommunityDetailsController>(
            builder: (controller) => Form(
              key: controller.formKey,
              child: Row(
                children: [
                  Expanded(
                    child: newPostTextField(
                        controller: controller.newPost,
                        keyboardType: TextInputType.multiline,
                        labelText: 'What is happening?',
                        hintText: '',
                        color: kPrimaryColor,
                        fillColor: kLightColor,
                        errorColor: itemColor,
                        maxLine: 6,
                        minLine: 1,
                        validate: controller.validate,
                      ),
                    ),
                  IconButton(
                    onPressed: (){
                      controller.createPost;
                      Get.snackbar(
                        'Feed',
                        'Post published successfully',
                        duration:  const Duration(seconds: 3),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: kPrimaryColor,
                        colorText: kForegroundColor,
                      );


                    },
                    icon: const ImageIcon(
                      AssetImage('assets/icons/send.png'),
                      size: 20.0,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}