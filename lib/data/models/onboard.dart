import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:turing/core/utils/styles.dart';

final onboardPages = [
  PageModel(
      color: kPrimaryColor,
      titleColor: kBackgroundColor,
      bodyColor: kBackgroundColor,
      imageAssetPath: 'assets/images/01.png',
      title: 'Articles',
      body: 'Share articles for everyone',
      doAnimateImage: true),
  PageModel(
      color: kPrimaryColor,
      titleColor: kBackgroundColor,
      bodyColor: kBackgroundColor,
      imageAssetPath: 'assets/images/02.png',
      title: 'communities',
      body: 'See the increase in productivity & output',
      doAnimateImage: true),
  PageModel(
      color: kPrimaryColor,
      titleColor: kBackgroundColor,
      bodyColor: kBackgroundColor,
      imageAssetPath: 'assets/images/03.png',
      title: 'Rooms',
      body: 'Connect with the people from different places',
      doAnimateImage: true),
  PageModel.withChild(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: Image.asset('assets/images/02.png', width: 300.0, height: 300.0),
      ),
      color: kPrimaryColor,
      titleColor: kBackgroundColor,
      bodyColor: kBackgroundColor,
      doAnimateChild: true,
  )
];