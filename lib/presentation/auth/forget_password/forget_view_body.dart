import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/core/widgets/default_text_field.dart';

class ForgetViewBody extends StatefulWidget {
  const ForgetViewBody({Key? key}) : super(key: key);

  @override
  State<ForgetViewBody> createState() => _ForgetViewBodyState();
}

class _ForgetViewBodyState extends State<ForgetViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  String? email;

  bool isLoading = false;
  bool isClicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: const Text(''),// You can add title here
        leading:  IconButton(
          icon:  const Icon(Icons.arrow_back_ios, color: kSecondColor),
          onPressed: () => Get.back(),
        ),
        backgroundColor: kMainColor, //You can make this transparent
        elevation: 0.0, //No shadow
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: kSecondColor,
                    child: Icon(
                      Icons.lock_outline,
                      size: 40,
                      color: kMainColor,
                    ),
                    maxRadius: 40,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'FORGET',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: kSecondColor,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  ),
                  const Text(
                    'PASSWORD',
                    style: TextStyle(
                      fontSize: 35.0,
                      color: kSecondColor,
                      fontWeight: FontWeight.w600,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Provide your account\'s email for which you want to reset your password!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kSecondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  DefaultTextField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    onChange: (data) {
                      email = data;
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Email Address must not be empty!';
                      }
                      return null;
                    },
                    labelText: 'Email Address',
                    textFieldColor: kSecondColor,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: kSecondColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefaultButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          Get.back();
                          isLoading = true;
                        });
                      }else {}
                    },
                    text: 'Send',
                    textColor: kMainColor,
                    themeColor: kSecondColor,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
