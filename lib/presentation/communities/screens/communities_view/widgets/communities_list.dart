import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/presentation/communities/screens/communities_view/widgets/community_item.dart';
import 'package:turing/presentation/communities/screens/community_details/community_details_view.dart';
import '../../../../../controllers/communities_controller.dart';
import '../../../../../core/utils/styles.dart';
import '../../community_details/controllers/community_details_controller.dart';

class CommunitiesList extends StatelessWidget {

  final ref = CommunitiesControllerCloud.instance.communitiesRef;
  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder(
          stream: ref.snapshots(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Some error happened'));
            }
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: const CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              );
            }
            if (snapshot.hasData){

              return ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return communitiesItem(
                    onTap: (){
                      CommunityDetailsController.instance.setDocId(snapshot.data.docs[index].id) ;
                      Get.to(() => const CommunityPageDetailsView(),
                        arguments: {
                          'communityId' : snapshot.data.docs[index].id,
                        },
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.downToUp,
                      );
                      print(snapshot.data.docs[index].id);
                    },
                    imgUrl: snapshot.data.docs[index].data()['imgUrl'],
                    titleText: snapshot.data.docs[index].data()['titleText'],
                    description: snapshot.data.docs[index].data()['description'],
                  );
                },
                itemCount: snapshot.data.docs.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              );
            }
            else{
              return Center(child: Text('Failed to load articles'));
            }
          },
        );

  }
}
