import 'package:flutter/material.dart';
import 'package:turing/presentation/profile/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  static String id = '/profile';

  @override
  Widget build(BuildContext context) {
    return ProfileViewBody();
  }
}
