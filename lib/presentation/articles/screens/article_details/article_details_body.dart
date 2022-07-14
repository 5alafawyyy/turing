import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/silver_appbar_with_dots.dart';
import 'package:turing/controllers/articles_controller.dart';

class ArticleDetailsBody extends StatelessWidget {
  ArticleDetailsBody({Key? key}) : super(key: key);

  ArticlesController controller = Get.put(ArticlesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: silverAppBarWithDots(
        appBarTitle: '${Get.arguments['titleText']}',
        appBarTitleColor: kPrimaryColor,
        backGroundColor: kBackgroundColor,
        context: context,
        height: 30,
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
        childCount: 1,
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: kLightColor,
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
              child: Text(
                Get.arguments['description'],
                style: const TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 1,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: kPrimaryColor,
                  child: Expanded(
                    child: Text(
                      'This article written by: ${Get.arguments['author']}',
                      style: TextStyle(
                        color: kLightColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       controller.loveArticle();
      //     },
      //     tooltip: 'Love',
      //     backgroundColor: kBackgroundColor,
      //     isExtended: true,
      //     splashColor: kLightColor,
      //     foregroundColor: kLightColor,
      //     hoverColor: kLightColor,
      //     focusColor: kLightColor,
      //     elevation: 0.0,
      //     child: GetBuilder<ArticlesController>(
      //       builder: (controller) => controller.isLoved ?
      //       Image.asset(
      //         'assets/icons/heart_fill.png',
      //         semanticLabel: 'Loved',
      //         color: kPrimaryColor,
      //         height: 35.0,
      //         width: 35.0,
      //
      //       )
      //           :
      //       Image.asset(
      //         'assets/icons/heart.png',
      //         color: kPrimaryColor,
      //         height: 35.0,
      //         width: 35.0,
      //       ),
      //     )),
    );
  }
}
