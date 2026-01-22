import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/utils/custom_icon.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_cubit.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cart.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final cart = state.cart.data;
        if (cart == null || cart.items.isEmpty) {
          return const Center(child: Text("Cart is empty"));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ...cart.items.map((item) {
              return ListTile(
                leading: Image.network(item.image),
                title: Text(item.nameByLocale(context.locale.languageCode)),
                subtitle: Text(item.total),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomIcon(
                      icon: Icons.remove,
                      isEnabled: true,
                      onTap: () {
                        context.read<CartCubit>().removeItem(item.productId);
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(item.quantity.toString()),
                    const SizedBox(width: 8),
                    CustomIcon(
                      icon: Icons.add,
                      isEnabled: true,
                      onTap: () {
                        // context.read<CartCubit>().addItem(item.productId);
                      },
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}
