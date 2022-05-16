import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/presentation/communities/screens/communities_view/widgets/community_item.dart';
import 'package:turing/presentation/communities/screens/community_details/community_details_view.dart';

class CommunitiesList extends StatelessWidget {
  const CommunitiesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (context, index) {
        return communitiesItem(
          onTap: (){
            Get.toNamed(CommunityPageDetailsView.id, arguments: {
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
            });
          },
            imgUrl: 'assets/images/problem-solving.jpg',
            titleText: 'Problem Solving Community',
            description: 'Students of FEE 53 graduation project',
        );
      },
    );
  }
}
