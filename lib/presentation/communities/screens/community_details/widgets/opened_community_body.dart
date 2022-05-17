import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/communities/screens/community_details/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/community_post_item.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/create_new_post.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/description_text.dart';

Widget openedCommunityBody () {
  return GetBuilder<CommunityDetailsController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          createNewPost(),
          ListView.separated(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return communityPostItem();
              },
            separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10.0,);
                },
          ),
        ],
      ),
    ),
  );
}