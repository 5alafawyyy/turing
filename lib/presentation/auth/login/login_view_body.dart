import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turing/controllers/login_controller.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/core/widgets/default_text_field.dart';
import 'package:turing/presentation/auth/forget_password/forget_view.dart';
import 'package:turing/presentation/auth/register/register_view.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({Key? key}) : super(key: key);


  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => ModalProgressHUD(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          //appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60.0,
                      ),
                      const CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          Icons.person_outline,
                          size: 40,
                          color: kBackgroundColor,
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
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextField(
                        controller: controller.emailController,
                        type: TextInputType.emailAddress,
                        onChange: (data) {
                          controller.email = data;
                          print(data);
                        },
                        validate:  controller.emailValidate,
                        labelText: 'Email Address',
                        textFieldColor: kPrimaryColor,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                  defaultTextField(
                          controller: controller.passwordController,
                          type: TextInputType.visiblePassword,
                          onChange: (data) {
                            controller.password = data;
                            print(data);
                          },
                          validate: controller.passValidate,
                          labelText: 'Password',
                          textFieldColor: kPrimaryColor,
                          prefixIcon: const Icon(
                            Icons.password_outlined,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: IconButton(
                            icon:  Icon(
                                controller.isClicked ? Icons.visibility_off_outlined : Icons.visibility,
                                color: kPrimaryColor,
                            ),
                            onPressed: controller.isVisible,
                          ),
                          obscure: controller.isClicked,
                        ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        onPressed: controller.onSubmit,
                        text: 'Sign In',
                        textColor: kForegroundColor,
                        themeColor: kPrimaryColor,
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
                                  color: kPrimaryColor,
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
                                  color: kPrimaryColor,
                                  height: 40,
                                ),
                              ),
                            ),
                            const Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: kPrimaryColor
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                child: const Divider(
                                  color: kPrimaryColor,
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
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RegisterView.id);
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: kPrimaryColor,
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
        inAsyncCall: controller.isLoading,
        progressIndicator: const CircularProgressIndicator(color: kPrimaryColor,),

      ),
    );
  }
}
