import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';

class CustomIcon extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool isEnabled;

  const CustomIcon({
    super.key,
    required this.onTap,
    required this.icon,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isEnabled ? AppColors.darkRed : AppColors.disabled,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.surface, size: 20),
      ),
    );
  }
}
