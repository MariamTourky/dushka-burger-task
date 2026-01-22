import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';

class BadgeContainer extends StatelessWidget {
  final int itemCount;

  const BadgeContainer({super.key, required this.itemCount}); // remove const

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.darkRed, width: 2),
      ),
      child: Text(
        itemCount.toString(),
        style: const TextStyle(
          color: AppColors.darkRed,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
