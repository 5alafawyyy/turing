import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/control_view.dart';

Widget silverAppBarWithSearch ({
  required String appBarTitle,
  required Color appBarTitleColor,
  required Widget backGroundWidget,
  required Color backGroundColor,
  required BuildContext context,
  required Widget bodyWidget,
  required bool showSearchIcon,
  double height = 180,
  double titleSize = 16.0,
  int childCount =1 ,
  Function()? onPressed ,
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
                Icons.arrow_back_ios,
            ),
            tooltip: 'Back',
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            (showSearchIcon)? IconButton(
              onPressed: onPressed == null? (){
                // showSearch(
                //   context: context,
                //   delegate: CustomSearchDelegate(),
                // );
              }
              :
              onPressed,
              icon: const Icon(Icons.search),
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