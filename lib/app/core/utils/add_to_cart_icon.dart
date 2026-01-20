import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';

class AddToCartIcon extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartIcon({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.darkRed,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        child: const SizedBox(
          width: 30,
          height: 30,
          child: Icon(Icons.add, color: AppColors.surface, size: 22),
        ),
      ),
    );
  }
}
