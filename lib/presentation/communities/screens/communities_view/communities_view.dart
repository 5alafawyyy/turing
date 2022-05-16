import 'package:flutter/material.dart';
import 'package:turing/presentation/communities/screens/communities_view/communities_view_body.dart';

class CommunitiesView extends StatelessWidget {
  const CommunitiesView({Key? key}) : super(key: key);
  static String id = '/Communities';

  @override
  Widget build(BuildContext context) {
    return const CommunitiesViewBody();
  }
}
