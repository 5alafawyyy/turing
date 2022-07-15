import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/communities/communities_view.dart';
import 'package:turing/controllers/profile_controller.dart';
import 'package:turing/presentation/onboarding/obboarding_view.dart';
import 'package:turing/presentation/profile/profile_page.dart';
import 'package:turing/presentation/settings/settings_view.dart';

import '../tic_tac_toe/game_view.dart';

class MyDrawer extends StatelessWidget{
   const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kBackgroundColor,
        child: ListView(
          children:
          [
            buildDrawerHeader(),
            // const Divider(
            //   color: kSecondColor,
            // ),
            buildDrawerItem(
                text: 'My Account',
                icon: Icons.person_outline,
                textIconColor: kPrimaryColor,
                tileColor: kSecondaryColor,
                onTap: (){
                  Get.to(() => ProfilePage(displayName: AuthController.instance.currentData.displayName, photoUrl: AuthController.instance.currentData.photoUrl),
                    transition: Transition.downToUp,
                  );
                },
            ),buildDrawerItem(
                text: 'See Introduction',
                icon: Icons.live_tv,
                textIconColor: kPrimaryColor,
                tileColor: kSecondaryColor,
                onTap: (){
                  Get.to(() => OnBoardingView(),
                    transition: Transition.downToUp,
                  );
                },
            ),
            buildDrawerItem(
              text: 'Communities',
              icon: Icons.people_alt_outlined,
              textIconColor: kPrimaryColor,
              tileColor: kSecondaryColor,
              onTap: (){
                Get.toNamed(CommunitiesView.id);
              },
            ),
            buildDrawerItem(
              text: 'Tic Tac Toe',
              icon: Icons.gamepad_outlined,
              textIconColor: kPrimaryColor,
              tileColor: kSecondaryColor,
              onTap: (){
                Get.to(() => GameView());
              },
            ),
            buildDrawerItem(
              text: 'Settings',
              icon: Icons.settings_outlined,
              textIconColor: kPrimaryColor,
              tileColor: kSecondaryColor,
              onTap: () {
                Get.toNamed(SettingsView.id);
              },
            ),
            buildDrawerItem(
                text: 'Logout',
                icon: Icons.close,
                textIconColor: kPrimaryColor,
                tileColor: kSecondaryColor,
                onTap: () async{
                  AuthController.instance.logout();
                  Get.offAllNamed(LoginView.id);
                  },
            ),

          ],
        ),
      ),
    );
  }

  buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      accountName: Text(
          '${AuthController.instance.currentData.displayName}',
        style:  TextStyle(
          fontWeight: FontWeight.bold,
          color: kForegroundColor,
        ),
      ),
      accountEmail: Text(
        '${AuthController.instance.currentData.email}',
        style:  TextStyle(
            color: kForegroundColor,
        ),
      ),
      currentAccountPicture: GestureDetector(
        onTap: (){
          Get.to(() => ProfilePage(displayName: AuthController.instance.currentData.displayName, photoUrl: AuthController.instance.currentData.photoUrl),
            transition: Transition.downToUp,
          );
        },
        child:  GetBuilder<ProfileController>(
          init: ProfileController(),
          builder: (controller) => CircleAvatar(
            backgroundImage:
            AuthController.instance.currentData.photoUrl == null
                ?
            AssetImage(
              'assets/images/no-user.png',
            )
                :
            NetworkImage(
              "${AuthController.instance.currentData.photoUrl}" ,
            ) as ImageProvider,
            foregroundColor: kLightColor,
            backgroundColor: kLightColor,
          ),
        ),
      ),
      currentAccountPictureSize: const Size.square(72.0),


);}

  buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color tileColor,
    required VoidCallback onTap,
}) {
    return ListTile(
      leading: Icon(icon, color: textIconColor,),
      title: Text(
        text,
        style: TextStyle(
            color: textIconColor,
        ),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

}