import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/communities/screens/community_details/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/community_post_item.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/create_new_post.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/description_text.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/post_view_body.dart';

import '../../../../../controllers/communities_controller.dart';

CommunityActivityBody(String communityId) {
  final communityRef = CommunitiesControllerCloud.instance.communitiesRef
      .doc('$communityId')
      .collection('posts')
      .orderBy('createdAt', descending: true);

  return GetBuilder<CommunityDetailsController>(
    builder: (controller) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          createNewPost(),
          StreamBuilder(
            //TODO: insert update to likes and comment and userData
            stream: communityRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Some error happened'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: const CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              }
              if (snapshot.hasData) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return communityPostItem(
                      showReacts: false,
                      displayName: snapshot.data.docs[index]
                          .data()['displayName']
                          .toString(),
                      photoUrl: snapshot.data.docs[index].data()['photoUrl'],
                      body: snapshot.data.docs[index].data()['body'].toString(),
                      noLikes: snapshot.data.docs[index].data()['noLikes'],
                      noComments:
                          snapshot.data.docs[index].data()['noComments'],
                      likePressed: () {},
                      // likeImage: const AssetImage('assets/icons/heart.png'),
                      // createdAt: snapshot.data.docs[index].data()['createdAt'],
                      onTap: ()  {
                         CommunityDetailsController.instance
                            .setPostId(snapshot.data.docs[index].id);
                        Get.to(() => PostViewBody(), arguments: {
                          'displayName': snapshot.data.docs[index]
                              .data()['displayName']
                              .toString(),
                          'photoUrl':
                              snapshot.data.docs[index].data()['photoUrl'],
                          'body': snapshot.data.docs[index]
                              .data()['body']
                              .toString(),
                          'noLikes':
                              snapshot.data.docs[index].data()['noLikes'],
                          'noComments':
                              snapshot.data.docs[index].data()['noComments'],
                        });
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10.0,
                    );
                  },
                  itemCount: snapshot.data.docs.length,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                );
              } else {
                return Center(child: Text('Failed to load articles'));
              }
            },
          ),
        ],
      ),
    ),
  );
}
