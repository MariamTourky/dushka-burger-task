import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/app/core/ui_helper/style/font_style.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/custom_elevated_button.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/page_header.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/product_info_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                ProductDetailsHeader(itemCount: state.quantity),
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
                CustomElevatedButtonWidget(state: state), // always visible
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddonsListWidget extends StatelessWidget {
  final ProductDetailsState state;

  const AddonsListWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final isArabic = locale == 'ar';

    if (!state.addons.isSuccess || state.addons.data == null) {
      return const SizedBox.shrink();
    }

    final blocks = state.addons.data!;
    if (blocks.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: blocks.map((block) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isArabic ? block.titleAr : block.titleEn,
              style: AppTextStyles.title,
            ),
            const SizedBox(height: 8),

            ...block.groups.map((group) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isArabic ? group.titleAr : group.titleEn,
                    style: AppTextStyles.title,
                  ),
                  const SizedBox(height: 6),

                  ...group.options.map((option) {
                    final isSelected =
                        state.selectedOptions[group.id] == option.id;

                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.read<ProductDetailsCubit>().selectOption(
                          group.id,
                          option.id,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.darkRed,
                                  width: 2,
                                ),
                                color: isSelected
                                    ? AppColors.darkRed
                                    : Colors.transparent,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                isArabic ? option.labelAr : option.labelEn,
                                style: AppTextStyles.bodyBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),
                ],
              );
            }),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}
