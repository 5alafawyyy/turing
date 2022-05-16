import 'package:flutter/material.dart';

Widget DefaultButton({
  required Function onPressed,
  required String text,
  required Color textColor,
  required Color themeColor,
  double width = double.infinity,
}) =>
    MaterialButton(
      onPressed: () {
        onPressed();
      },
      elevation: 5.0,
      minWidth: width,
      height: 45,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 25.0,
        ),
      ),
      color: themeColor,
    );
