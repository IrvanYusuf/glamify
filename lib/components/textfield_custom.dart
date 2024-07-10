import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final dynamic keyboardType;
  final TextEditingController controller;
  final String? errorMessage;
  final bool isConfirmPassword;
  final TextEditingController? originalPasswordController;
  final Widget? suffixIcon;
  const TextFieldCustom({
    super.key,
    required this.hintText,
    required this.obscureText,
    this.keyboardType,
    required this.controller,
    this.errorMessage,
    required this.isConfirmPassword,
    this.originalPasswordController,
    this.suffixIcon,
  });

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          // borderSide: BorderSide.,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                child: _obscureText
                    ? widget.suffixIcon
                    : Icon(Icons.visibility_off_rounded),
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorMessage;
        }
        if (widget.isConfirmPassword &&
            widget.originalPasswordController != null) {
          if (value != widget.originalPasswordController!.text) {
            return "Password tidak sesuai";
          }
        }
        return null;
      },
    );
  }
}
