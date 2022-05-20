import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';

class NotificationsView extends StatelessWidget {
  static String id = '/NotificationsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: BodyText(
                text: 'You don\'t have notifications right now.',
                size: 16,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}