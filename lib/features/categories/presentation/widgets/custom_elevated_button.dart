import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';

import 'package:trust_develpoment/generated/locale_keys.g.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final ProductDetailsState state;

  const CustomElevatedButtonWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isEnabled = state.quantity > 0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: isEnabled ? () {} : null,
          child: Text(LocaleKeys.add_to_cart.tr()),
        ),
      ),
    );
  }
}
