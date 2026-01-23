import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/app/core/utils/custom_icon.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_cubit.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/empty_product.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/product_shimmer.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.cart.isLoading) {
              return const ProductDetailsShimmer();
            }

            final cart = state.cart.data;
            if (cart == null || cart.items.isEmpty) {
              return const EmptyProductsWidget();
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ...cart.items.map(
                  (item) => ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Image.network(item.image, fit: BoxFit.cover),
                      ),
                    ),
                    title: Text(item.nameByLocale(context.locale.languageCode)),
                    subtitle: Text(item.total),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomIcon(
                          icon: Icons.delete_outline,
                          isEnabled: true,
                          onTap: () {
                            context.read<CartCubit>().removeItem(
                              productId: item.productId,
                              quantity: 1,
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        Text(item.quantity.toString()),
                        const SizedBox(width: 8),
                        CustomIcon(
                          icon: Icons.add,
                          isEnabled: true,
                          onTap: () {
                            context.push(
                              '${RouteName.productDetails}?id=${item.productId}&quantity=${item.quantity}',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
