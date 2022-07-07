import 'package:flutter/cupertino.dart';

class BodyText extends StatelessWidget{
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  int maxLines;
  double textHeight;
  TextAlign textAlign;
  BodyText(
      {
        Key? key,
        required this.color,
        required this.text,
        this.size = 12,
        this.overflow = TextOverflow.ellipsis,
        this.maxLines = 2,
        this.textHeight = 1.4,
        this.textAlign = TextAlign.start
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        height: textHeight,
        fontSize: size,
        color: color,
      ),
    );
  }

}