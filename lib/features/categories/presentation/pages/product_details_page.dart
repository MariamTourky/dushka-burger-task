import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_validation.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/addons_list_widget.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/custom_elevated_button.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/page_header.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/product_info_widget.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/product_shimmer.dart';
import 'package:trust_develpoment/generated/locale_keys.g.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final isButtonEnabled =
            state.quantity > 0 && state.areAllRequiredAddonsValid;

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                ProductDetailsHeader(itemCount: state.quantity),
                Expanded(
                  child: state.product.isLoading
                      ? const ProductDetailsShimmer()
                      : state.product.data == null
                      ? const Center(child: Text("Product not found"))
                      : ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
                            ProductInfoWidget(state: state),
                            const SizedBox(height: 24),
                            AddonsListWidget(state: state),
                          ],
                        ),
                ),
                CustomElevatedButtonWidget(
                  text: LocaleKeys.add_to_cart.tr(),
                  enabled: isButtonEnabled,
                  onPressed: () {
                    context.read<CartCubit>().addItem(
                      state.product.data!.id,
                      quantity: state.quantity,
                    );
                    context.push(RouteName.viewCart);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
