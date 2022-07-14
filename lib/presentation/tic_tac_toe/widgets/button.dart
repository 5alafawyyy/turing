import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turing/core/utils/styles.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double bottomPadding;
  const MyButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.bottomPadding = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40, bottom: bottomPadding),
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: new LinearGradient(
                    colors: [
                      Color(0xFFbdc3c7),
                      Color(0xff535a5a),
                      Color(0xff394958),
                      Color(0xFF2c3e50),
                    ],
                    stops: [
                      0.1,
                      0.5,
                      0.7,
                      0.9
                    ],
                    begin: FractionalOffset.centerLeft,
                    end: FractionalOffset.centerRight,
                    tileMode: TileMode.repeated,
                ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 13.0,
                  color: kLightColor,
                  fontWeight: FontWeight.w600
                ),
              ), // Text
            ), // Center // Container
          ),
        ));
  }
}
