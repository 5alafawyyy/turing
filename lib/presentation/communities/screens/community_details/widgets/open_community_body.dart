import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/controllers/community_details_controller.dart';
import 'package:turing/presentation/communities/screens/community_details/widgets/description_text.dart';

import 'community_activity_body.dart';

CommunityDetailsController controller = Get.put(CommunityDetailsController());
Widget openedCommunityBody({
  required String statusText,
  required int peopleNumber,
  required String description,
}) =>
    GetBuilder<CommunityDetailsController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  statusText,
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' . ',
                  style: TextStyle(
                    height: .5,
                    color: kPrimaryColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$peopleNumber Members',
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: const Divider(
                color: kPrimaryColor,
                height: 40,
              ),
            ),
            DescriptionTextWidget(text: description),
            defaultButton(
              text: 'Show activity',
              textColor: kForegroundColor,
              themeColor: kPrimaryColor,
              onPressed: () {
                controller.enterCommunity();
                },
            )
          ],
        ),
      ),
    );
