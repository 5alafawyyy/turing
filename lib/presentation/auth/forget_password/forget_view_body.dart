import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turing/controllers/forget_pass_controller.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/default_button.dart';
import 'package:turing/core/widgets/default_text_field.dart';

class ForgetViewBody extends StatelessWidget {
   ForgetViewBody({Key? key}) : super(key: key);

   ForgetPassController controller = Get.put(ForgetPassController());

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPassController>(
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
                      const CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          Icons.lock_outline,
                          size: 40,
                          color: kBackgroundColor,
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
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                        ),
                      ),
                      const Text(
                        'PASSWORD',
                        style: TextStyle(
                          fontSize: 35.0,
                          color: kPrimaryColor,
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
                          color: kPrimaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defaultTextField(
                        controller: controller.emailController,
                        type: TextInputType.emailAddress,
                        onChange: (data) {
                          controller.email = data;
                          print(data);
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
                      defaultButton(
                        onPressed: controller.onSubmit,
                        text: 'Send',
                        textColor: kForegroundColor,
                        themeColor: kPrimaryColor,
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
        ),
        inAsyncCall: controller.isLoading,
        progressIndicator: const CircularProgressIndicator(color: kPrimaryColor,),

      ),
    );
  }
}
