import 'package:flutter/material.dart';

Widget DefaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  required String labelText,
  required Icon prefixIcon,
  required Color textFieldColor,
  required validate,
  IconButton? suffixIcon,
  bool obscure = false,
  Function(String)? onSubmit,
  Function(String)? onChange,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (s){
        onSubmit!(s);
      },
      onChanged: (s){
        onChange!(s);
      },
      validator: validate,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: textFieldColor,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: textFieldColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
             Radius.circular(4),
          ),
          borderSide: BorderSide(
            width: 1,
            color: textFieldColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
             Radius.circular(4),
          ),
          borderSide: BorderSide(
            width: 1,
            color: textFieldColor,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
    );