import 'package:flutter/material.dart';
import 'package:turing/core/constants/styles.dart';

class RoomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  const RoomButton({Key? key, required this.onPressed, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children:
        [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.circular(16),
              // boxShadow:
              // const [
              //   BoxShadow(
              //     blurRadius: 1,
              //     color: kMainColor,
              //     offset: Offset(0,4),
              //   ),
              // ]
            ),
            child: Icon(
              icon,
              color: kSecondColor,
              size: 30,)
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: kMainColor,
            ),),
        ],
      ),
    );
  }
}
