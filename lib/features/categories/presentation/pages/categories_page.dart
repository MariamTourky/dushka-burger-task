import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_develpoment/app/core/utils/app_list_shimmer.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/categories_cubit/categories_state.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/cart_floating_button.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/category_list.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/custom_navigation_bar.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/empty_product.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/product_list.dart';

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
            floatingActionButton: const CartFloatingButton(itemCount: 3),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }
}
