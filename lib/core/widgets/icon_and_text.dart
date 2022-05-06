import 'package:flutter/material.dart';
import 'package:turing/core/widgets/body_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double textSize;
  final Color iconColor;
  final double iconSize;

  const IconAndText({Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.iconColor,
    required this.iconSize,
    required this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        const SizedBox(width: 5,),
        BodyText(
          text: text,
          size: textSize,
          color: color,
        ),

      ],
    );
  }
}
