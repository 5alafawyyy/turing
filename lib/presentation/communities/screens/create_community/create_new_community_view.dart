import 'package:flutter/material.dart';
import 'package:turing/presentation/communities/screens/create_community/create_new_community_view_body.dart';

class CreateCommunityView extends StatelessWidget {
  const CreateCommunityView({Key? key}) : super(key: key);
  static String id  = '/CreateCommunityView';

  @override
  Widget build(BuildContext context) {
    return  CreateCommunityViewBody();
  }
}
