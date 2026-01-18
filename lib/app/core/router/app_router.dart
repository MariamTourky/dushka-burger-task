import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: RouteName.categories,
      //  builder: (context, state) => CategoriesScreen(),
    ),
    GoRoute(
      path: RouteName.productDetails,
      // builder: (context, state) => ProductDetailsScreen(
      //   productId: state.extra as int,
      // ),
    ),
    GoRoute(
      path: RouteName.viewCart,
      //builder: (context, state) => ViewCartScreen(),
    ),
  ],
);
