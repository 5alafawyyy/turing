import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/body_text.dart';
import '../../../../../core/widgets/title_text.dart';
import '../../../../profile/screens/profile_page/profile_page.dart';

Widget commentOfPost({
required String displayName,
required String photoUrl,
required String body,
}){
  return Column(
    children: [
      Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => ProfilePage(
                displayName: displayName,
                photoUrl: photoUrl,
              ));
            },
            child: Tab(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: NetworkImage(
                  photoUrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          TitleText(
            color: kPrimaryColor,
            text: '$displayName',
            size: 14.0,
          ),
        ],
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 2.0),
        color: kLightColor.withOpacity(0.3),
        child: BodyText(
          size: 15.0,
          maxLines: 4,
          color: kPrimaryColor,
          text: body,
        ),
      ),

    ],
  );
}