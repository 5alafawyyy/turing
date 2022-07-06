import 'package:flutter/material.dart';
import 'package:turing/core/widgets/body_text.dart';

class IconImageAndText extends StatelessWidget {
  final AssetImage image;
  final String text;
  final Color color;
  final double textSize;
  final Color iconColor;
  final double iconSize;
  final Function() onTap;

  const IconImageAndText({Key? key,
    required this.image,
    required this.text,
    required this.color,
    required this.iconColor,
    required this.iconSize,
    required this.textSize,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onTap,
        icon: ImageIcon(
          image,
          color: iconColor,
          size: iconSize,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: color,
          ),
        ),
    );
  }
}
