import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turing/controllers/control_view.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/core/widgets/default_text_field.dart';
import 'package:turing/presentation/auth/forget_password/forget_view.dart';
import 'package:turing/presentation/auth/register/register_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {

  GlobalKey<FormState> formKey = GlobalKey();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String? email, password;
  bool isLoading = false;
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: false,
      child: Scaffold(
        backgroundColor: kMainColor,
        //appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60.0,
                    ),
                    const CircleAvatar(
                      backgroundColor: kSecondColor,
                      child: Icon(
                        Icons.person_outline,
                        size: 40,
                        color: kMainColor,
                      ),
                      maxRadius: 40,
                    ),
                    const SizedBox(
                      height:5.0,
                    ),
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 35.0,
                        color: kSecondColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
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
                    DefaultTextField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      onChange: (data) {
                        password = data;
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password must not be empty!';
                        }
                        if (value.toString().length < 6) {
                          return 'Password must be at least 6 characters!';
                        }
                        // return null;
                      },
                      labelText: 'Password',
                      textFieldColor: kSecondColor,
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: kSecondColor,
                      ),
                      suffixIcon: IconButton(
                        icon:  Icon(
                          isClicked ? Icons.visibility_off_outlined : Icons.visibility,
                          color: kSecondColor,
                        ),
                        onPressed: ()
                        {
                          setState(() {
                            isClicked =! isClicked;
                          });
                        },
                      ),
                      obscure: isClicked,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DefaultButton(
                      onPressed: () async {

                        if (formKey.currentState!.validate()) {
                          setState(() {
                            Get.offAllNamed(ControlView.id);
                            isLoading = true;
                          });
                      }else {}
                      },
                      text: 'Sign In',
                      textColor: kMainColor,
                      themeColor: kSecondColor,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed(ForgetView.id);
                          },
                          child: const Text(
                            'Forget Password? ',
                            style: TextStyle(
                                color: kSecondColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    Row(
                        children:
                        [
                          Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: const Divider(
                                    color: kSecondColor,
                                    height: 40,
                                  ),
                              ),
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: kSecondColor
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: const Divider(
                                color: kSecondColor,
                                height: 40,
                              ),
                            ),
                          ),
                        ]
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(color: kSecondColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(RegisterView.id);
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: kSecondColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
