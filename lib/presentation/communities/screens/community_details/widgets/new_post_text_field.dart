import 'package:flutter/material.dart';

Widget newPostTextField ({
  required TextEditingController controller,
  required String labelText,
  required Color color,
  required Color fillColor,
  required Color errorColor,
  required TextInputType keyboardType,
  required validate,
  String hintText = '',
  int maxLine = 5,
  int minLine = 5,
  double borderSideRadius = 30,
}){
  return TextFormField(
    maxLines: maxLine,
    minLines: minLine,
    enableSuggestions: true,
    autofocus: false,
    controller: controller,
    keyboardType: keyboardType,
    validator: validate,
    autocorrect: true,
    cursorColor: color,
    style: const TextStyle(
      height: 1.4,
      fontSize: 15.0
    ),
    decoration: InputDecoration(
      filled: true,
      fillColor: fillColor,
      labelText: labelText,
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      labelStyle: TextStyle(
        color: color,
        fontSize: 16.0,
      ),
      border:  OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:  BorderRadius.all(
          Radius.circular(borderSideRadius),
        ),
        borderSide: BorderSide(
          width: 1,
          color: color,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius:  BorderRadius.all(
          Radius.circular(borderSideRadius),
        ),
        borderSide: BorderSide(
          width: 1,
          color: color,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderSideRadius),
        ),
        borderSide: BorderSide(
          width: 1,
          color: errorColor,
        ),
      ),
    ),
  );
}

