import 'package:flutter/material.dart';
import 'package:turing/presentation/auth/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static String id = '/login';
  @override
  Widget build(BuildContext context) {
    return LoginViewBody();
  }
}
