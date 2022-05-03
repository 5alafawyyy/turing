import 'package:flutter/material.dart';
import 'package:turing/presentation/auth/forget_password/forget_view_body.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({Key? key}) : super(key: key);

  static String id = '/forgetPassword';
  @override
  Widget build(BuildContext context) {
    return ForgetViewBody();
  }
}
