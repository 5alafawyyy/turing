import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/round_image.dart';
import 'package:turing/data/models/user.dart';
import 'package:turing/presentation/profile/screens/profile_page/profile_page.dart';

class RoomProfile extends StatelessWidget {
  final UserModel user;
  final double size;
  final bool isMute;
  final bool isModerator;

  const RoomProfile(
      {required this.user,
      required this.size,
      this.isMute = false,
      this.isModerator = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                // Get.to(
                //   () => ProfilePage(),
                // );
              },
              child: RoundImage(
                path: "UserModel.photoUrl",
                width: size,
                height: size,
                url: '',
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildModeratorBadge(isModerator),
            Expanded(
              child: Text(
                "user.name.split(' ')[0]",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildModeratorBadge(bool isModerator) {
    return isModerator
        ? Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            height: 15.0,
            width: 15.0,
            child: const Icon(
              Icons.star,
              color: kWhiteColor,
              size: 12,
            ),
          )
        : Container();
  }

  Widget buildMuteBadge(bool isMute) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: isMute
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: const Icon(
                  Icons.mic_off,
                color: kSecondaryColor,
              ),
            )
          : Container(),
    );
  }

  Widget buildNewBadge(bool isNewUser) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: isNewUser
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: const Text(
                '🎉',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: kPrimaryColor
                ),
              ),
            )
          : Container(),
    );
  }
}
