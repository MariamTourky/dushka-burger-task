import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/config/di/di_config/di.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/features/categories/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:trust_develpoment/features/categories/presentation/pages/categories_page.dart';

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
    // GoRoute(
    //   path: RouteName.productDetails,
    //   builder: (context, state) {
    //     final products = state.extra as List<ProductEntity>? ?? [];
    //     return ProductDetailsPage(products: products);
    //   },
    // ),
    // GoRoute(
    //   path: RouteName.viewCart,
    //   //builder: (context, state) => ViewCartScreen(),
    // ),
  ],
);
