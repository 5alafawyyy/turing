import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turing/controllers/register_controller.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/core/widgets/default_text_field.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({Key? key}) : super(key: key);

  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (controller) => ModalProgressHUD(
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            title: const Text(''),// You can add title here
            leading:  IconButton(
              icon:  const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
              onPressed: () => Get.back(),
            ),
            backgroundColor: kBackgroundColor, //You can make this transparent
            elevation: 0.0, //No shadow
          ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      // defaultTextField(
                      //   controller: controller.userController,
                      //   type: TextInputType.name,
                      //   onChange: (data)
                      //   {
                      //     controller.name = data;
                      //   },
                      //   validate: controller.userValidate,
                      //   labelText: 'User Name',
                      //   textFieldColor: kPrimaryColor,
                      //   prefixIcon: const Icon(
                      //     Icons.person_outline,
                      //     color: kPrimaryColor,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      defaultTextField(
                        controller: controller.emailController,
                        type: TextInputType.emailAddress,
                        onChange: (data)
                        {
                          controller.email = data;
                        },
                        validate: controller.emailValidate,
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
                        onChange: (data)
                        {
                          // controller.password = data;
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
                        text: 'Sign Up',
                        textColor: kForegroundColor,
                        themeColor: kPrimaryColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: SignInButton(
                          Buttons.Google,
                          text: "Sign Up with Google",
                          onPressed: () async {
                            await controller.googleLogout();
                          },
                          elevation: 0.5,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          TextButton(
                            onPressed: ()
                            {
                              Get.back();
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: kPrimaryColor, fontWeight: FontWeight.bold),
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
