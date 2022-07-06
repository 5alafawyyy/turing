import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/controllers/authController.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/round_image.dart';

class ProfilePage extends StatelessWidget {
  static String id = '/profilePage';
   String displayName;
   String photoUrl;
  ProfilePage ({ required this.displayName, required this.photoUrl });

  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
        child: Column(
          children: [
            buildProfile(),
            const SizedBox(
              height: 20,
            ),
            builderInviter(),
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            backgroundImage: NetworkImage(
              photoUrl,
        ),
        radius: 50.0,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          displayName,
          style: const TextStyle(
            fontSize: 25,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "50k",
                    style: const TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: ' followers'),
                ],
                style: const TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "1",
                    style: const TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: ' following'),
                ],
                style: const TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            "Founder of Turing",
            style: const TextStyle(
              fontSize: 15,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget builderInviter() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            photoUrl,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Joined Mar 28, 2022',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            RichText(
              text: const TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Nominated by ',
                  ),
                  TextSpan(
                    text: 'Turing',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                style: TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
