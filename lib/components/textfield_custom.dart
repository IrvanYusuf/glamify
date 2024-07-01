import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final dynamic keyboardType;
  const TextFieldCustom(
      {super.key,
      required this.hintText,
      required this.obscureText,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        hintText: hintText,
        border: OutlineInputBorder(
          // borderSide: BorderSide.,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }
}
