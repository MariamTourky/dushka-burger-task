import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';

Widget rowPrice(String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: AppTextStyles.bodyBold),
      Text(value, style: AppTextStyles.price),
    ],
  );
}
