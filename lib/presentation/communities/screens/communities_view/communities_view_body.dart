import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/silver_appbar_with_search.dart';
import 'package:turing/presentation/communities/screens/communities_view/widgets/community_item.dart';
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
        bodyWidget: communitiesItem(
          onTap: () {

            Get.to(() => const CommunityPageDetailsView(),
              arguments: {
                  'imgUrl': 'assets/images/problem-solving.jpg',
                  'titleText': 'Problem Solving Community',
                  'description': 'Problem solving is the act of defining and'
                      ' determining the cause of  identifying,'
                      ' prioritizing, and selecting alternatives for a solution'
                      ' and implementing a solution. Problem solving is the act of defining a problem'
                      ' determining the cause of the problem; identifying,'
                      ' prioritizing, and selecting alternatives for a solution;'
                      ' and implementing a solution.and selecting alternatives for a solution;'
                      ' Problem solving is the act of defining a '
                      ' determining the cause of the problem; identifying,'
                      ' prioritizing, and selecting alternatives for a solution;'
                      ' and implementing a solution.',
                },
              duration: const Duration(milliseconds: 500),
              transition: Transition.downToUp,
            );
          },
          imgUrl: 'assets/images/problem-solving.jpg',
          titleText: 'Problem Solving Community',
          description: 'Problem solving is the act of defining and'
              ' determining the cause of  identifying,'
              ' prioritizing, and selecting alternatives for a solution'
              ' and implementing a solution. Problem solving is the act of defining a problem'
              ' determining the cause of the problem; identifying,'
              ' prioritizing, and selecting alternatives for a solution;'
              ' and implementing a solution.and selecting alternatives for a solution;'
              ' Problem solving is the act of defining a '
              ' determining the cause of the problem; identifying,'
              ' prioritizing, and selecting alternatives for a solution;'
              ' and implementing a solution.',
        ),
        context: context,
        showSearchIcon: true,
        childCount: 30,
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
            duration: const Duration(milliseconds: 1000),
            transition: Transition.circularReveal,

          );
        },
      ),


      // CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       snap: false,
      //       pinned: false,
      //       floating: false,
      //       flexibleSpace: FlexibleSpaceBar(
      //           centerTitle: true,
      //           title: const Text(
      //               'Communities',
      //               style: TextStyle(
      //                 color: kPrimaryColor,
      //                 fontSize: 16.0,
      //               )
      //           ),
      //           background: Container(
      //             height: double.infinity,
      //             color: kForegroundColor,
      //           )
      //       ),
      //       expandedHeight: 180,
      //       backgroundColor: kPrimaryColor,
      //       leading: IconButton(
      //         icon: const Icon(Icons.arrow_back_ios),
      //         tooltip: 'Back',
      //         onPressed: () {
      //           Get.back();
      //         },
      //       ),
      //       actions: [
      //         IconButton(
      //           onPressed: (){
      //             showSearch(
      //               context: context,
      //               delegate: CustomSearchDelegate(),
      //             );
      //           },
      //           icon: const Icon(Icons.search),
      //         ),
      //       ],
      //     ), //SliverAppBar
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //             (context, index) => SingleChildScrollView(
      //               child: Column(
      //                 children: const [
      //                   SizedBox(
      //                     height: 20,
      //                   ),
      //                   CommunitiesList(),
      //                 ],
      //               ),
      //             ),
      //         childCount: 3,
      //
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
// AppBar(
//         centerTitle: true,
//         title: const Text(
//           'Communities',
//         ),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios,
//           ),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//       )
