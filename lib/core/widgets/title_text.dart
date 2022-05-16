import 'package:flutter/cupertino.dart';
import 'package:turing/core/utils/styles.dart';

class TitleText extends StatelessWidget{
  Color? color;
  final String text;
  double size;
  int maxLine;
  TextOverflow overflow;
  TitleText(
  {
  Key? key,
    required this.color,
    required this.text,
    this.size = 18,
    this.maxLine = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w600,
      ),
    );
  }

}