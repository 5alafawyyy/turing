import 'package:flutter/material.dart';
import 'package:turing/presentation/auth/register/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);
  static String id = '/Register';
  @override
  Widget build(BuildContext context) {
    return RegisterViewBody();
  }
}
