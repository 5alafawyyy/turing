import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/auth/login/login_view.dart';
import 'package:turing/presentation/profile/screens/view/profile_view.dart';
import 'package:turing/presentation/setting/setting_view.dart';

class CustomDrawer extends StatelessWidget{
   const CustomDrawer({Key? key}) : super(key: key);

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
                text: 'Profile',
                icon: Icons.person_outline,
                textIconColor: kPrimaryColor,
                tileColor: kSecondaryColor,
                onTap: (){
                  Get.toNamed(ProfileView.id);
                },
            ),
            buildDrawerItem(
              text: 'Settings',
              icon: Icons.settings_outlined,
              textIconColor: kPrimaryColor,
              tileColor: kSecondaryColor,
              onTap: () {
                Get.toNamed(SettingView.id);
              },
            ),
            buildDrawerItem(
                text: 'Logout',
                icon: Icons.close,
                textIconColor: kPrimaryColor,
                tileColor: kSecondaryColor,
                onTap: () {
                  Get.offAllNamed(LoginView.id);
                  },
            ),

          ],
        ),
      ),
    );
  }

  buildDrawerHeader() {
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: kPrimaryColor,
      ),
      accountName: Text(
          'Ahmed Khallaf',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: kForegroundColor,
        ),
      ),
      accountEmail: Text(
        'ahmedkhallaf2098@gmail.com',
        style: TextStyle(
            color: kForegroundColor,
        ),
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('assets/images/ahmedkhallaf.jpeg',),
      ),
      currentAccountPictureSize: Size.square(72.0),
      otherAccountsPictures: 
      [
        CircleAvatar(
          backgroundColor: kForegroundColor,
          child: Text(
            'AK',
            style: TextStyle(
              color: kPrimaryColor
            ),),
        ),
      ],
      otherAccountsPicturesSize: Size.square(50.0),

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