import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget silverAppBarWithDots ({
  required String appBarTitle,
  required Color appBarTitleColor,
  Widget? backGroundWidget,
  required Color backGroundColor,
  required Widget iconWidget,
  required BuildContext context,
  required Widget bodyWidget,
  required bool showDotsIcon,
  double height = 180,
  double titleSize = 16.0,
  int childCount =1 ,
}){
  return CustomScrollView(
    slivers: <Widget>[
      SliverPadding(
        padding: const EdgeInsets.only(bottom: 0.0),
        sliver: SliverAppBar(
          snap: false,
          pinned: true,
          elevation: 0.0,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
                appBarTitle,
                style: TextStyle(
                  height: 0,
                  color: appBarTitleColor,
                  fontSize: titleSize,
                )
            ),
            background: backGroundWidget,
          ),
          expandedHeight: height,
          backgroundColor: backGroundColor,
          leading: IconButton(
            icon: const Icon(
              Icons.clear,
            ),
            tooltip: 'Back',
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            (showDotsIcon)? IconButton(
              onPressed: (){
                //
              },
              icon: iconWidget,
            ): const Text('')
          ],
        ),
      ), //SliverAppBar
      SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) => bodyWidget,
          childCount: childCount,
        ),
      )
    ],
  );
}