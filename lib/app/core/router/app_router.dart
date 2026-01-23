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
  initialLocation: RouteName.categoriesPage,
  routes: [
    GoRoute(
      path: RouteName.categoriesPage,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => getIt<CategoriesCubit>()..fetchCategories(),
          child: const CategoriesPage(),
        );
      },
    ),
    GoRoute(
      path: RouteName.productDetailsPage,
      builder: (context, state) {
        final productId = int.parse(state.uri.queryParameters['id']!);
        final quantityArg = state.extra as int? ?? 0;
        return BlocProvider(
          create: (_) =>
              getIt<ProductDetailsCubit>()
                ..loadProduct(productId, initialQuantity: quantityArg),
          child: ProductDetailsPage(
            productId: productId,
            initialQuantity: quantityArg,
          ),
        );
      },
    ),

    GoRoute(path: RouteName.cartPage, builder: (_, _) => const CartPage()),
  ],
);
