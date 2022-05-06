import 'package:flutter/cupertino.dart';
import 'package:turing/core/utils/styles.dart';

class TitleText extends StatelessWidget{
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  TitleText(
  {
  Key? key,
    this.color = kSecondColor,
    required this.text,
    this.size = 18,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        fontSize: size,
        color: color?.withOpacity(0.65),
        fontWeight: FontWeight.w600,
      ),
    );
  }

}