
import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/round_image.dart';
import 'package:turing/data/models/room.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({ required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(
          color: kLightColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 1),
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            room.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: kPrimaryColor
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              buildProfileImages(),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildUserList(),
                  const SizedBox(
                    height: 5,
                  ),
                  buildRoomInfo(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProfileImages() {
    return Stack(
      children: [
        RoundImage(
          margin: const EdgeInsets.only(top: 15, left: 25),
          path: room.users[1].profileImage,
        ),
        RoundImage(
          path: room.users[0].profileImage,
        ),
      ],
    );
  }

  Widget buildUserList() {
    var len = room.users.length > 4 ? 4 : room.users.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < len; i++)
          Row(
            children: [
              Text(
                room.users[i].name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.chat,
                color: kSecondaryColor,
                size: 14,
              ),
            ],
          )
      ],
    );
  }

  Widget buildRoomInfo() {
    return Row(
      children: [
        Text(
          '${room.users.length}',
          style: const TextStyle(
            color: kSecondaryColor,
          ),
        ),
        const Icon(
          Icons.supervisor_account,
          color: kSecondaryColor,
          size: 14,
        ),
        const Text(
          '  /  ',
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 10,
          ),
        ),
        Text(
          '${room.speakerCount}',
          style: const TextStyle(
            color: kSecondaryColor,
          ),
        ),
        const Icon(
          Icons.chat_bubble_rounded,
          color: kSecondaryColor,
          size: 14,
        ),
      ],
    );
  }
}