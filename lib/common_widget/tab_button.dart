import 'package:flutter/material.dart';

import '../common/color_extensions.dart';

class TabButton extends StatelessWidget {

  final VoidCallback onTap;
  final String title;
  final bool isSelect;
  final String icon;

  const TabButton(
      {super.key, required this.onTap, required this.title, required this.isSelect, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 15,
            height: 15,
            color: isSelect? TColor.primary : TColor.placeholder,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(
                color: isSelect? TColor.primary : TColor.placeholder,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
