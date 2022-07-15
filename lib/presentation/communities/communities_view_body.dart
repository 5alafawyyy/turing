import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/silver_appbar_with_search.dart';
import 'package:turing/presentation/communities/widgets/communities_list.dart';
import 'package:turing/presentation/communities/widgets/community_item.dart';
import 'package:turing/presentation/communities/screens/community_details/community_details_view.dart';
import 'package:turing/presentation/communities/screens/create_community/create_new_community_view.dart';

class CommunitiesViewBody extends StatelessWidget {
  const CommunitiesViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightColor,
      body: silverAppBarWithSearch(
        appBarTitle: 'Communities',
        backGroundWidget: Container(
          color: kLightColor,
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Container(
            color: kForegroundColor,
            child: Image.asset(
              'assets/images/03.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        appBarTitleColor: kPrimaryColor,
        backGroundColor: kForegroundColor,
        bodyWidget: CommunitiesList(),
        context: context,
        showSearchIcon: true,
        childCount: 1,
        height: 300,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        tooltip: 'Create New Community',
        label: const Text(''),
        icon: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
        foregroundColor: kBackgroundColor,
        onPressed: () {
          Get.to(() => const CreateCommunityView(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.circularReveal,
          );
        },
      ),
    );
  }
}

