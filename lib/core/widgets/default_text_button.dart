import 'package:flutter/material.dart';

Widget defaultTextButton({
  required Function function,
  required String text,
  TextStyle? isBold,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
        style: isBold,
      ),
    );