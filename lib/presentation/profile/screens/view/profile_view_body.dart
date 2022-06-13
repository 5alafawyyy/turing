import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/profile/screens/edit_profile/edit_profile.dart';
import 'package:turing/presentation/profile/screens/notification/notification.dart';
import 'package:turing/presentation/profile/widgets/profile_menu.dart';
import 'package:turing/presentation/profile/widgets/profile_pic.dart';
import 'package:turing/presentation/setting/setting_view.dart';

import '../../../../controllers/authController.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

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
          ProfileMenu(
            text: "Edit Profile",
            icon: "assets/icons/user.png",
            onPressed: (){
            Get.to(() => EditProfileView(),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 500),
            );
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/notification.png",
            onPressed: () {
              Get.to(() => NotificationsView(),
                transition: Transition.rightToLeftWithFade,
                duration: const Duration(milliseconds: 500),
              );
              },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/settings.png",
            onPressed: () {
              Get.to(() => const SettingView(),
                transition: Transition.leftToRight,
              );
            },
          ),
          ProfileMenu(
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
