import 'package:flutter/material.dart';

Widget customTextFormField ({
  required TextEditingController controller,
  required String labelText,
  required Color color,
  required Color fillColor,
  required Color errorColor,
  required TextInputType keyboardType,
  required validate,
  String hintText = '',
  int maxLine = 1,
  int minLine = 1,
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
    decoration: InputDecoration(
      filled: true,
      fillColor: fillColor,
      labelText: labelText,
      hintText: hintText,
      labelStyle: TextStyle(
        color: color,
      ),
      // prefixIcon: const Icon(Icons.title),
      border:  OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius:  const BorderRadius.all(
          Radius.circular(4),
        ),
        borderSide: BorderSide(
          width: 1,
          color: color,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        borderSide: BorderSide(
          width: 1,
          color: color,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        borderSide: BorderSide(
          width: 1,
          color: errorColor,
        ),
      ),
    ),
  );
}

