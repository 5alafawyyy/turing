import 'package:flutter/material.dart';
import 'package:turing/core/constants/styles.dart';

Widget CustomAppBar({
  required String title,
}) => AppBar(
  leadingWidth: 50,
  leading: IconButton(
    onPressed: ()
    {

    },
    icon: const Icon(
      Icons.menu,
      color: kMainColor,
      size: 30,
    )

  ),
  centerTitle: true,
  title: Text(
    title,
    style: TextStyle(
      color: kMainColor,
    ),
  ),
  actions: [
    Icon(
      Icons.settings_outlined,
      color: kMainColor,
      size: 30,
    ),
    SizedBox(
      width: 10,
    )
  ],
  elevation: 0,
  backgroundColor: kSecondColor,
);