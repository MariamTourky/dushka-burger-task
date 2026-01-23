import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';
import 'package:trust_develpoment/features/cart/presentation/widgets/raw_price.dart';
import 'package:trust_develpoment/generated/locale_keys.g.dart';

class PaymentSummary extends StatelessWidget {
  final CartEntity cart;

  const PaymentSummary({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${LocaleKeys.payment_details.tr()} :",
          style: AppTextStyles.headlineMedium,
        ),
        const SizedBox(height: 8),
        rowPrice(LocaleKeys.total_price.tr(), cart.totalPrice),
        rowPrice("السعر الاجمالي بعد الضرائب", cart.totalPriceWithTax),
      ],
    );
  }
}
