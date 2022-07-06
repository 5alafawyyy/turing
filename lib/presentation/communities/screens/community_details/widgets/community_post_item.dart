import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/icon_image_with_text.dart';
import 'package:turing/core/widgets/title_text.dart';
import '../../../../profile/screens/profile_page/profile_page.dart';

Widget communityPostItem({
  required String displayName,
  required String photoUrl,
  required String body,
  int? noLikes,
  int? noComments,
  // required DateTime createdAt,
  void Function()? onTap,
  required bool showReacts,
  bool showComment = true,
  Color color = kForegroundColor,
  required dynamic Function() likePressed,
  // required AssetImage likeImage ,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(
              height: 10.0,
            ),
            showReacts == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$noLikes likes',
                        style: TextStyle(
                          fontSize: 15,
                          color: kPrimaryColor,
                        ),
                      ),
                      Text(
                        '$noComments comments',
                        style: TextStyle(
                          fontSize: 15,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 0.0,
                  ),
            showComment == true
                ? const Divider(
                    color: kPrimaryColor,
                  )
                : const SizedBox(
                    height: 0.0,
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconImageAndText(
                //   image: const AssetImage('assets/icons/heart.png'),
                //   text: 'Love',
                //   color: kPrimaryColor,
                //   iconColor: kPrimaryColor,
                //   iconSize: 20.0,
                //   textSize: 15.0,
                //   onTap:  likePressed,
                // ),
                showComment == true
                    ? IconImageAndText(
                        image: const AssetImage('assets/icons/comment.png'),
                        text: 'Comment',
                        color: kPrimaryColor,
                        iconColor: kPrimaryColor,
                        iconSize: 20.0,
                        textSize: 15.0,
                        onTap: () {
                          //TODO: add comment
                        },
                      )
                    : const SizedBox(
                        height: 0.0,
                      ),
                // IconImageAndText(
                //   image: const AssetImage('assets/icons/share.png'),
                //   text: 'Share',
                //   color: kPrimaryColor,
                //   iconColor: kPrimaryColor,
                //   iconSize: 20.0,
                //   textSize: 15.0,
                //   onTap: () {  },
                // ),
              ],
            )
          ],
        )),
  );
}
