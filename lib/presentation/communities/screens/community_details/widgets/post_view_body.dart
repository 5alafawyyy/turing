import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/comment_of_post.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/community_post_item.dart';

import '../controllers/community_details_controller.dart';
import 'create_comment.dart';

class PostViewBody extends StatelessWidget {



   final commentRef = CommunityDetailsController.instance.postRefComments.orderBy('createdAt', descending: true);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: commentRef.snapshot,
      builder: (context, snapshot) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Get.back();
            },
          ),
          title: Text('${Get.arguments['displayName']}'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: kLightColor,
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<CommunityDetailsController>(
                  init: CommunityDetailsController(),
                  builder: (controller) => communityPostItem(
                    color: kLightColor,
                    showReacts: false,
                    showComment: false,
                    displayName: '${Get.arguments['displayName']}',
                    photoUrl: '${Get.arguments['photoUrl']}',
                    body: '${Get.arguments['body']}',
                    noLikes: Get.arguments['noLikes'],
                    noComments: Get.arguments['noComments'],
                    commentPressed: controller.likePressed,
                  ),
                ),
              ),
              const SizedBox(
                height: 2.0,
              ),
              createNewComment(),
              const SizedBox(
                height: 5.0,
              ),
              StreamBuilder(
                stream: commentRef.snapshots(),
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
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            color: itemColor.withOpacity(0.2),
                            child: commentOfPost(
                                displayName: snapshot.data.docs[index]
                                    .data()['displayName']
                                    .toString(),
                                photoUrl: snapshot.data.docs[index].data()['photoUrl'],
                                body: snapshot.data.docs[index].data()['body'].toString(),
                            ),
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
                      ),
                    );
                  } else {
                    return Center(child: Text('Failed to load articles'));
                  }
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
