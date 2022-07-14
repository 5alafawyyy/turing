import 'package:flutter/material.dart';

class OH extends StatelessWidget {
  double size;
  Color color;

  OH({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        gradient: RadialGradient(
          radius: .30,
          colors: [Colors.transparent, color],
          stops: [1, 1],
        ),
      ),
    );
  }
}
