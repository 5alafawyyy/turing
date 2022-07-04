import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';
import 'package:turing/core/widgets/round_image.dart';

class RoomCard extends StatelessWidget {

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
            //TODO: GET Room Title
            "room.title",
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
              // buildProfileImages(),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  // buildRoomInfo(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

}