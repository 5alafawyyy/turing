import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/newCommentTextField.dart';
import '../../../../../controllers/authController.dart';

Widget createNewComment (){
  return Container(
    color: kLightColor.withOpacity(.8),
    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
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
              key: controller.formKey1,
              child: Row(
                children: [
                  Expanded(
                    child: newCommentTextField(
                      controller: controller.newComment,
                      keyboardType: TextInputType.multiline,
                      labelText: '  Write a comment',
                      hintText: '',
                      color: kPrimaryColor,
                      fillColor: kBackgroundColor.withOpacity(0.3),
                      errorColor: itemColor,
                      maxLine: 3,
                      minLine: 1,
                      validate: controller.validate,
                    ),
                  ),
                  IconButton(
                    onPressed: () async{
                      controller.createComment('${Get.arguments['id']}');
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