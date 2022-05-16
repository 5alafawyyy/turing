import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/silver_appbar_with_dots.dart';
import 'package:turing/presentation/communities/screens/community_details/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/closed_community_body.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/create_new_post.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/opened_community_body.dart';

class CommunityPageDetailsViewBody extends StatelessWidget {
  CommunityPageDetailsViewBody({Key? key}) : super(key: key);

  CommunityDetailsController controller = Get.put(CommunityDetailsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: silverAppBarWithDots(
          appBarTitle: '${Get.arguments['titleText']}',
          appBarTitleColor: kPrimaryColor,
          backGroundWidget: Container(
            color: kBackgroundColor,
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Container(
              color: kForegroundColor,
              child: Image.asset(
                '${Get.arguments['imgUrl']}',
                // color: kForegroundColor.withOpacity(0.6),
                // colorBlendMode: BlendMode.screen,
                fit: BoxFit.cover,
              ),
            ),
          ),
          backGroundColor: kForegroundColor,
          context: context,
          height: 280,
          showDotsIcon: true,
          iconWidget: PopupMenuButton(
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


          // Body
          childCount: controller.childCount,
          bodyWidget: GetBuilder<CommunityDetailsController>(


            builder: (controller) =>
            controller.joined?
            openedCommunityBody()
                :
            closedCommunityBody(
              statusText: controller.statusText,
              peopleNumber: controller.peopleNumber,
              description: '${Get.arguments['description']}',
            ),
          ),
        ),
      ),
    );
  }
}
