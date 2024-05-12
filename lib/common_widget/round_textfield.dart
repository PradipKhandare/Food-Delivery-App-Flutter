import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;

  const RoundTextField({super.key, this.controller, required this.hintText, this.keyboardType, this.obscureText = false});

@override
Widget build(BuildContext context) {
  return
    Container(
      decoration: BoxDecoration(
          color: TColor.textBox,
          borderRadius: BorderRadius.circular(25)
      ),
      child: TextField(
          autocorrect: false,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                color: TColor.placeholder,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          )
      ),
    );
}}
