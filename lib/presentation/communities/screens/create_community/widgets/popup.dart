import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';

Widget customPopup({
  required GlobalKey key,
  required String text1,
  required String text2,
  required VoidCallback onTap1,
  required VoidCallback onTap2,
  IconData icon = Icons.image,
  double size = 25.0,
}) =>
    PopupMenuButton<int>(
      key: key,
      icon: Icon(icon, color: kForegroundColor, size: size,),
      color: kLightColor,
      tooltip: 'Choose Cover Image',
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: GestureDetector(
            child: Text(
              text1,
              style: const TextStyle(
                color: kPrimaryColor,
              ),
            ),
            onTap: onTap1,
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: GestureDetector(
            child: Text(
              text2,
              style: const TextStyle(
                color: kPrimaryColor,
              ),
            ),
            onTap: onTap2,
          ),
        ),
      ],
    );
