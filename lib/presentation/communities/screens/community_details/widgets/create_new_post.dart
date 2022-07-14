import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/new_post_text_field.dart';
import '../../../../../controllers/authController.dart';

Widget createNewPost (){
  CommunityDetailsController controller = Get.put(CommunityDetailsController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15),
    child: Row(
      children:  [
        CircleAvatar(
            radius: 18.0,
            backgroundImage: NetworkImage(
                AuthController.instance.currentData.photoUrl,
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
                    onPressed: () async {
                      controller.createPost();
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