import 'package:flutter/material.dart';
import 'package:turing/presentation/setting/setting_view_body.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);
  static String id = '/settings';

  @override
  Widget build(BuildContext context) {
    return const SettingViewBody();
  }
}
