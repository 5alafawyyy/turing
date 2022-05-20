import 'package:flutter/material.dart';

Widget defaultTextButton({
  required Function function,
  required String text,
  TextStyle? style,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
        style: style,
      ),
    );