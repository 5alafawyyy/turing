import 'package:flutter/material.dart';
import 'package:turing/presentation/communities/screens/community_details/community_details_view_body.dart';


class CommunityPageDetailsView extends StatelessWidget {
  const CommunityPageDetailsView({Key? key}) : super(key: key);
  static String id  = '/CommunityPageDetails';

  @override
  Widget build(BuildContext context) {
    return CommunityPageDetailsViewBody();
  }
}
