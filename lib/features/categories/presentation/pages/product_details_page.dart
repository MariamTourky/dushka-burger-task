import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/app/core/widgets/custom_button.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/cart_floating_button.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  ProductDetailsHeader(
                    itemCount: state.quantity,
                  ), // always visible
                  Expanded(
                    child: state.product.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.darkRed,
                            ),
                          )
                        : state.product.data == null
                        ? const Center(child: Text("Product not found"))
                        : ListView(
                            padding: const EdgeInsets.all(16),
                            children: [
                              ProductInfoWidget(state: state),
                              const SizedBox(height: 16),
                              AddonsListWidget(state: state),
                            ],
                          ),
                  ),
                  AddToCartButtonWidget(state: state), // always visible
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ProductDetailsHeader extends StatelessWidget {
  final int itemCount;
  const ProductDetailsHeader({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: [
                const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                const SizedBox(width: 4),
                Text(
                  "Back",
                  style: AppTextStyles.title.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          CartFloatingButton(itemCount: itemCount),
        ],
      ),
    );
  }
}

class ProductInfoWidget extends StatelessWidget {
  final ProductDetailsState state;
  const ProductInfoWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final product = state.product.data!;
    final locale = context.locale.languageCode;
    final productName = locale == 'ar' ? product.nameAr : product.nameEn;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.image,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Text(productName, style: AppTextStyles.headlineMedium),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${product.price} EP', style: AppTextStyles.price),
            Row(
              children: [
                GestureDetector(
                  onTap: () =>
                      context.read<ProductDetailsCubit>().decrementQuantity(),
                  child: CircleIconButton(
                    icon: Icons.remove,
                    isEnabled: state.quantity > 0,
                  ),
                ),
                const SizedBox(width: 8),
                Text('${state.quantity}', style: AppTextStyles.headlineMedium),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () =>
                      context.read<ProductDetailsCubit>().incrementQuantity(),
                  child: const CircleIconButton(
                    icon: Icons.add,
                    isEnabled: true,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          locale == 'ar' ? product.descriptionAr : product.descriptionEn,
          style: AppTextStyles.body,
        ),
      ],
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final bool isEnabled;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isEnabled ? AppColors.darkRed : AppColors.disabled,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.surface, size: 20),
    );
  }
}

class AddonsListWidget extends StatelessWidget {
  final ProductDetailsState state;
  const AddonsListWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.languageCode;
    final addonBlocks = state.addons.data ?? [];

    if (addonBlocks.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: addonBlocks.map((block) {
        final blockTitle = locale == 'ar' ? block.titleAr : block.titleEn;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              blockTitle,
              style: AppTextStyles.title.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: block.options.map((option) {
                final isSelected = state.selectedOptions[block.id] == option.id;
                final label = locale == 'ar' ? option.labelAr : option.labelEn;

                return GestureDetector(
                  onTap: () => context.read<ProductDetailsCubit>().selectOption(
                    block.id,
                    option.id,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.darkRed
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.darkRed
                            : AppColors.divider,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.surface
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}

class AddToCartButtonWidget extends StatelessWidget {
  final ProductDetailsState state;
  const AddToCartButtonWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final isEnabled = state.quantity > 0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: CustomButton(
        isEnabled: isEnabled,
        isLoading: false,
        text: "Add To Cart",
        onPressed: () => {},
      ),
    );
  }
}
