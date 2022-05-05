import 'package:flutter/material.dart';
import 'package:turing/presentation/home/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id = '/home';
  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}
