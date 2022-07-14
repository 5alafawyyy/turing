import 'package:flutter/material.dart';
import 'package:turing/presentation/change_theme/dark_light_mode_view_body.dart';

class DarkLightModeView extends StatelessWidget {
  const DarkLightModeView({Key? key}) : super(key: key);
  static String id = '/darkMode';

  @override
  Widget build(BuildContext context) {
    return const DarkLightModeViewBody();
  }
}
