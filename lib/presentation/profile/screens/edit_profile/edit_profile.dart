import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/custom_text_form_field.dart';
import 'package:turing/core/widgets/default_text_button.dart';
import 'package:turing/core/widgets/title_text.dart';
import 'package:turing/presentation/profile/controllers/profile_controller.dart';


class EditProfileView extends StatelessWidget {

  static String id = '/EditProfileView';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          GetBuilder<ProfileController>(
            init: ProfileController(),
            builder: (controller) => Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                  const EdgeInsets.only(right: 16, left: 16, bottom: 24),
                  child: Card(
                    color: kWhiteColor.withOpacity(0.95),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child:
                      Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: const AssetImage(
                                      'assets/images/ahmedkhallaf.jpeg'),
                                  foregroundImage: controller.image !=
                                      null
                                      ? FileImage(controller.image!)
                                      : null,
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    Get.dialog(
                                      AlertDialog(
                                        title: TitleText(
                                          text: 'Choose option',
                                          size: 20,
                                          color: kPrimaryColor,
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Divider(
                                              height: 1,
                                            ),
                                            ListTile(
                                              onTap: () {
                                                try {
                                                  controller
                                                      .cameraGetter();
                                                  Get.back();
                                                } catch (error) {
                                                  Get.back();
                                                }
                                              },
                                              title: BodyText(
                                                text: 'Camera',
                                                size: 20,
                                                color: kPrimaryColor,
                                              ),
                                              leading: const ImageIcon(
                                                AssetImage('assets/icons/camera_fill.png'),
                                                color: kSecondaryColor,
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                            ),
                                            ListTile(
                                              onTap: () {
                                                try {
                                                  controller
                                                      .galleryGetter();
                                                  Get.back();
                                                } catch (error) {
                                                  Get.back();
                                                }
                                              },
                                              title: BodyText(
                                                text: 'Gallery',
                                                size: 20,
                                                color: kPrimaryColor,
                                              ),
                                              leading: const ImageIcon(
                                                AssetImage('assets/icons/image-gallery.png'),
                                                color: kSecondaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Select Image'),
                                  color: kPrimaryColor,
                                  textColor: kBackgroundColor,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 38,
                            ),
                            customTextFormField(
                                controller: controller.nameController,
                                labelText: 'Name',
                                color: kPrimaryColor,
                                fillColor: Colors.white,
                                errorColor: Colors.red,
                                keyboardType: TextInputType.text,
                                validate: controller.validate,
                            ),
                            const SizedBox(
                              height: 38,
                            ),
                            Column(
                              children: [
                                customTextFormField(
                                  controller: controller.emailController,
                                  labelText: 'Email',
                                  color: kPrimaryColor,
                                  fillColor: Colors.white,
                                  errorColor: Colors.red,
                                  keyboardType: TextInputType.text,
                                  validate: controller.validate,
                                ),
                                const SizedBox(
                                  height: 38,
                                ),
                                customTextFormField(
                                  controller: controller.passController,
                                  labelText: 'Password',
                                  color: kPrimaryColor,
                                  fillColor: Colors.white,
                                  errorColor: Colors.red,
                                  keyboardType: TextInputType.text,
                                  validate: controller.validate,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            defaultTextButton(
                              text: 'SUBMIT',
                              function: controller.updateProfile,
                              style: const TextStyle(
                                color: kPrimaryColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}