import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/presentation/rooms/widgets/rounded_image.dart';
import '../../../data/models/room_model.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);
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
                  usersList(),
                  const SizedBox(
                    height: 5,
                  ),
                  roomInfo(),
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
        RoundedImage(
          margin: const EdgeInsets.only(top: 15, left: 25),
          path: 'assets/images/profile.png',
        ) ,
        RoundedImage(
            // path: 'assets/images/profile.png',
            url: room.users[0].photoUrl,
        ),
      ],
    );
  }

  Widget usersList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < room.users.length; i++)
          Container(
            child: Row(
              children: [
                Text(
                  room.users[i].displayName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.chat, color: Colors.grey, size: 14),
              ],
            ),
          )
      ],
    );
  }

  Widget roomInfo() {
    return Row(
      children: [
        Text(
          '${room.users.length}',
          style: TextStyle(color: Colors.grey),
        ),
        Icon(Icons.supervisor_account, color: Colors.grey, size: 14),
        Text(
          '  /  ',
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
        Text(
          '${room.speakerCount}',
          style: TextStyle(color: Colors.grey),
        ),
        Icon(Icons.chat_bubble_rounded, color: Colors.grey, size: 14),
      ],
    );
  }
}