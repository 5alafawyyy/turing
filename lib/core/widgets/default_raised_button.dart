import 'package:flutter/material.dart';
import 'package:turing/core/constants/styles.dart';

Widget DefaultRaisedButton ({
  required Function onPressed,
  required Text label,
  required Icon icon,
  ButtonStyle? style,

}) =>
    Container(
      width: double.infinity,
      color: kSecondColor,
      padding: EdgeInsets.symmetric(vertical: 2),
      child: ElevatedButton.icon(
          onPressed: (){
            onPressed();
          },
          icon: icon,
          label: label,
        style: style,
      ),
    );