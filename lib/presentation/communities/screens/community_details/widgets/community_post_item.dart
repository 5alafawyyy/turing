import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/icon_and_text.dart';
import 'package:turing/core/widgets/icon_image_with_text.dart';
import 'package:turing/core/widgets/title_text.dart';

Widget communityPostItem(){
  return Container(
    padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 5.0,
    ),
    color: kForegroundColor.withOpacity(0.8),
    child: Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: (){},
              child: const Tab(
                icon: CircleAvatar(
                  radius: 15.0,
                  backgroundImage: AssetImage(
                    'assets/images/ahmedkhallaf.jpeg',
                  ),
                ),
              ),
            ),
            const SizedBox( width: 10.0,),
            TitleText(
                color: kPrimaryColor,
                text: 'Ahemd Khallaf',
              size: 14.0,
            ),
          ],
        ),
        BodyText(
          size: 13.0,
          maxLines: 4,
          color: kPrimaryColor,
          text: 'This is a post from the Problem Solving Community as w notified before is a post from the Problem Solving Community as w notified before Solving Community as w notified before is a post',
        ),
        const Divider(
          color: kPrimaryColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconImageAndText(
              image: const AssetImage('assets/icons/heart.png'),
              text: 'Love',
              color: kPrimaryColor,
              iconColor: kPrimaryColor,
              iconSize: 20.0,
              textSize: 15.0,
              onTap: () {  },
            ),
            IconImageAndText(
              image: const AssetImage('assets/icons/comment.png'),
              text: 'Comment',
              color: kPrimaryColor,
              iconColor: kPrimaryColor,
              iconSize: 20.0,
              textSize: 15.0,
              onTap: () {  },
            ),
            IconImageAndText(
              image: const AssetImage('assets/icons/share.png'),
              text: 'Share',
              color: kPrimaryColor,
              iconColor: kPrimaryColor,
              iconSize: 20.0,
              textSize: 15.0,
              onTap: () {  },
            ),
          ],
        )
      ],
    )
  );
}