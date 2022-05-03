import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turing/core/constants/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/core/widgets/default_text_field.dart';
import 'package:turing/presentation/auth/login/login_view.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {

  GlobalKey<FormState> formKey = GlobalKey();

  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  String? name;
  String? email;
  String? password;

  bool isLoading = false;
  bool isClicked = true;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                            color: kSecondColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    DefaultTextField(
                      controller: userController,
                      type: TextInputType.name,
                      onChange: (data)
                      {
                        name = data;
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Name must not be empty!';
                        }
                        return null;
                      },
                      labelText: 'User Name',
                      textFieldColor: kSecondColor,
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: kSecondColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DefaultTextField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      onChange: (data)
                      {
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
                      onChange: (data)
                      {
                        password = data;
                      },
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password must not be empty!';
                        }
                        if (value.toString().length < 6) {
                          return 'Password must be at least 6 characters!';
                        }
                        // return value;
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
                      onPressed: () async
                      {
                        if(formKey.currentState!.validate()){
                          setState(() {
                            isLoading = true;
                          });

                        } else {}
                      },
                      text: 'Sign Up',
                      textColor: kMainColor,
                      themeColor: kSecondColor,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(color: kSecondColor),
                        ),
                        TextButton(
                          onPressed: ()
                          {
                            Get.back();
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: kSecondColor, fontWeight: FontWeight.bold),
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
