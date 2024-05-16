import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class RoundTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Color? bgColor;
  final Widget? left;

  const RoundTextField(
      {super.key,
      this.controller,
      required this.hintText,
      this.keyboardType,
      this.obscureText = false,
      this.bgColor,
      this.left});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor ?? TColor.textBox,
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        children: [
          if (left != null) Padding(
            padding: const EdgeInsets.only(left: 15, ),
            child: left!,
          ),
          Expanded(
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
                      fontWeight: FontWeight.w500),
                )),
          ),
        ],
      ),
    );
  }
}
