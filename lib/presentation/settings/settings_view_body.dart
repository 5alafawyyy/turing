import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/profile/screens/edit_profile/edit_profile.dart';
import 'package:turing/presentation/settings/widgets/settings_menu.dart';
import 'package:turing/presentation/profile/widgets/profile_pic.dart';
import 'package:turing/presentation/change_theme/dark_light_mode_view.dart';

import '../../controllers/authController.dart';
import '../profile/profile_page.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
            children: [
               ProfilePic(),
              const SizedBox(
                  height: 20,
              ),
              SettingsMenu(
                text: "My Account",
                icon: "assets/icons/user.png",
                onPressed: (){
                  Get.to(() => ProfilePage(displayName: AuthController.instance.currentData.displayName, photoUrl: AuthController.instance.currentData.photoUrl),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                  );
                },
              ),
              SettingsMenu(
                text: "Edit Profile",
                icon: "assets/icons/pen.png",
                onPressed: (){
                Get.to(() => EditProfileView(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                );
                },
              ),
              SettingsMenu(
                text: "Theme Mode",
                icon: "assets/icons/dark-light.png",
                onPressed: () {
                  Get.to(() => const DarkLightModeView(),
                    transition: Transition.rightToLeftWithFade,
                    duration: const Duration(milliseconds: 500),
                  );
                },
              ),
              SettingsMenu(
                text: "Log Out",
                icon: "assets/icons/exit.png",
                onPressed: () async{
                  AuthController.instance.logout();
                  Get.offAll(
                        () => const LoginView(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 500)
                  );
                },
              ),
            ],
          ),

    );
  }
}
