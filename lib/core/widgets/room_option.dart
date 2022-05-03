import 'package:flutter/material.dart';
import 'package:turing/core/constants/styles.dart';

class RoomOption extends StatelessWidget {
  final String text;
  final bool isMute;
  final Function(bool) onChange;

  const RoomOption({Key? key, required this.text, required this.isMute, required this.onChange}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: kSecondColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch.adaptive(
            value: isMute,
          onChanged: onChange,)


        ],
      ),
    );
  }
}
