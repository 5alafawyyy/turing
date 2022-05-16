import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/community_post_item.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/create_new_post.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/description_text.dart';

Widget openedCommunityBody () {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      children: [
        createNewPost(),
        ListView.separated(
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
  );
}