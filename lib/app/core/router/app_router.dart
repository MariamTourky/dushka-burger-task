import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/config/di/di_config/di.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/features/cart/presentation/pages/cart_page.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/pages/categories_page.dart';
import 'package:trust_develpoment/features/categories/presentation/pages/product_details_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RouteName.categories,
  routes: [
    GoRoute(
      path: RouteName.categories,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<CategoriesCubit>()..fetchCategories(),
          child: const CategoriesPage(),
        );
      },
    ),
    GoRoute(
      path: RouteName.productDetails,
      builder: (context, state) {
        final productId = int.tryParse(state.uri.queryParameters['id'] ?? '');
        if (productId == null) return const SizedBox();

        final initialQuantity =
            int.tryParse(state.uri.queryParameters['quantity'] ?? '0') ?? 0;

        return BlocProvider(
          create: (_) =>
              getIt<ProductDetailsCubit>()
                ..loadProduct(productId, initialQuantity: initialQuantity),
          child: ProductDetailsPage(
            productId: productId,
            initialQuantity: initialQuantity,
          ),
        );
      },
    ),

    GoRoute(path: RouteName.viewCart, builder: (_, _) => const CartPage()),
  ],
);
