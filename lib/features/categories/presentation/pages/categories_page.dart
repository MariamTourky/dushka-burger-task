import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/shimmer_list.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_cubit.dart';
import 'package:trust_develpoment/features/cart/presentation/manager/cart_state.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/categories_cubit/categories_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/cart_button.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/categories_sections/category_list.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/categories_sections/custom_navigation_bar.dart';
import 'package:trust_develpoment/app/core/utils/empty_product.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/product_details_section/product_list.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        final categoriesResource = state.categories;

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: categoriesResource.isLoading
                      ? const ShimmerList(
                          itemWidth: 120,
                          itemHeight: 100,
                          scrollDirection: Axis.horizontal,
                        )
                      : CategoryList(
                          categories: categoriesResource.data ?? [],
                          selectedId: state.selectedCategoryId,
                          onCategorySelected: (id) {
                            context.read<CategoriesCubit>().selectCategory(id);
                          },
                        ),
                ),
                Expanded(
                  child: categoriesResource.isLoading
                      ? const ShimmerList(
                          itemWidth: double.infinity,
                          itemHeight: 100,
                        )
                      : (state.selectedProducts == null ||
                            state.selectedProducts!.isEmpty)
                      ? const EmptyProductsWidget()
                      : ProductList(products: state.selectedProducts!),
                ),
              ],
            ),
            bottomNavigationBar: const CustomBottomNavigationBar(),
            floatingActionButton: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                final itemCount = state.itemCount;
                return CartButton(itemCount: itemCount);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
