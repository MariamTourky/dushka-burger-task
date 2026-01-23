import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/app/core/utils/back_container.dart';
import 'package:trust_develpoment/app/core/utils/custom_elevated_button.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_cubit.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_state.dart';
import 'package:trust_develpoment/app/core/utils/empty_product.dart';
import 'package:trust_develpoment/features/cart/presentation/widgets/cart_item_list.dart';
import 'package:trust_develpoment/app/core/utils/shimmer_skeleton.dart';
import 'package:trust_develpoment/features/cart/presentation/widgets/payment_summary.dart';
import 'package:trust_develpoment/generated/locale_keys.g.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  const BackContainer(),
                  const SizedBox(width: 40),
                  Text(
                    LocaleKeys.shopping_cart.tr(),
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: AppColors.darkRed,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state.cart.isLoading) {
                      return const ShimmerSkeleton();
                    }

                    final cart = state.cart.data;
                    if (cart == null || cart.items.isEmpty) {
                      return const EmptyProductsWidget();
                    }

                    return Column(
                      children: [
                        Expanded(child: CartItemsList(items: cart.items)),
                        const SizedBox(height: 12),
                        const Divider(),
                        PaymentSummary(cart: cart),
                        CustomElevatedButtonWidget(
                          text: "المتابعه للدفع",
                          onPressed: () {},
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
