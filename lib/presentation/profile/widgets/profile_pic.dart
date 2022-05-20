import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/body_text.dart';
import 'package:turing/core/widgets/title_text.dart';
import 'package:turing/presentation/profile/controllers/profile_controller.dart';


class ProfilePic extends StatelessWidget {

  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          GetBuilder<ProfileController>(
            builder: (controller) => CircleAvatar(
              backgroundImage:  controller.image == null?
              const AssetImage(
                "assets/images/ahmedkhallaf.jpeg",
              )
                  :
              Image.file(
                controller.image,
                fit: BoxFit.cover,
              ).image,
              backgroundColor: kPrimaryColor,

            ),
          ),
          Positioned(
            right: -10,
            bottom: 4,
            child: SizedBox(
              height: 35,
              width: 35,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: kBackgroundColor),
                  ),
                  primary: kSecondaryColor,
                  backgroundColor: kSecondaryColor,
                ),
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
                  // controller.cameraGetter();
                },
                child: const ImageIcon(
                    AssetImage(
                        'assets/icons/camera.png',
                    ),
                  color: kBackgroundColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


