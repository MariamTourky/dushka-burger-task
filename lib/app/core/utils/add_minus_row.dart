import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/app/core/utils/custom_icon.dart';

class AddMinusRow extends StatelessWidget {
  final int quantity;
  final IconData minusIconDesign;
  final VoidCallback onAddTap;
  final VoidCallback onMinusTap;

  const AddMinusRow({
    super.key,
    required this.quantity,
    required this.minusIconDesign,
    required this.onAddTap,
    required this.onMinusTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(
          onTap: onMinusTap,
          icon: minusIconDesign,
          isEnabled: quantity > 0,
        ),
        const SizedBox(width: 8),
        Text('$quantity', style: AppTextStyles.headlineMedium),
        const SizedBox(width: 8),
        CustomIcon(onTap: onAddTap, icon: Icons.add, isEnabled: true),
      ],
    );
  }
}
