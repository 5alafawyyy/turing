import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/silver_appbar_with_dots.dart';
import 'package:turing/presentation/communities/screens/community_details/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/closed_community_body.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/community_activity_body.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/open_community_body.dart';

import '../../../../controllers/communities_controller.dart';

class CommunityPageDetailsViewBody extends StatelessWidget {
  String communityId;
  CommunityPageDetailsViewBody({required this.communityId});
  CommunityDetailsController controller = Get.put(CommunityDetailsController());
  final communityRef = CommunitiesControllerCloud.instance.communitiesRef
      .doc('${Get.arguments['communityId']}');

  @override
  Widget build(BuildContext context) {
    controller.setDocId(communityId);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
          future: communityRef.get(),
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
              return silverAppBarWithDots(
                appBarTitle: snapshot.data
                    .data()['titleText'],
                appBarTitleColor: kPrimaryColor,
                backGroundWidget: Container(
                  color: kBackgroundColor,
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Container(
                    color: kForegroundColor,
                    child: Image.network(
                      snapshot.data.data()['imgUrl'],
                      fit: BoxFit.cover,
                    ),
                    ),
                  ),
                backGroundColor: kForegroundColor,
                context: context,
                height: 280,
                showDotsIcon: true,
                iconWidget: GetBuilder<CommunityDetailsController>(
                  builder: (controller) => controller.enter
                      ? PopupMenuButton(
                          key: controller.menuKey,
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: 1,
                              child: GestureDetector(
                                child: const Text(
                                  'Report',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: GestureDetector(
                                child: const Text(
                                  'Leave',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                onTap: () {
                                  controller.enterCommunity();
                                },
                              ),
                            ),
                          ],
                        )
                      : PopupMenuButton(
                          key: controller.menuKey,
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              value: 1,
                              child: GestureDetector(
                                child: const Text(
                                  'Report',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                  ),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                ),

                // Body
                childCount: 1,
                bodyWidget: GetBuilder<CommunityDetailsController>(
                  builder: (controller) =>
                  snapshot.data.data()['isOpened'] == true
                      ?
                  (
            controller.enter == false
                ?
            openedCommunityBody(
                    statusText: "Opened",
                    peopleNumber: snapshot.data
                        .data()['noMembers'],
                    description: snapshot.data
                        .data()['description'],
                  )
                :
            CommunityActivityBody( communityId)
                  )
                      :
                  closedCommunityBody(
                          statusText: "Closed",
                          peopleNumber: snapshot.data
                              .data()['noMembers'],
                          description: snapshot.data
                              .data()['description'],
                        ),
                ),
              );
            }
            else{
              return Center(child: Text('Failed to load communities'));
            }
          }),
    );
  }
}
