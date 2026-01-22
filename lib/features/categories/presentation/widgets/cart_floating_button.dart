import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_develpoment/app/core/router/route_names.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/badge_container.dart';

class CartFloatingButton extends StatelessWidget {
  final int itemCount;

  const CartFloatingButton({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final bool hasItems = itemCount > 0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          shape: const CircleBorder(),
          color: hasItems ? AppColors.darkRed : AppColors.disabled,
          elevation: 8,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: hasItems ? () => context.push(RouteName.viewCart) : null,
            child: const SizedBox(
              width: 60,
              height: 60,
              child: Center(
                child: Icon(
                  Icons.shopping_bag_rounded,
                  color: AppColors.surface,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
        if (hasItems)
          Positioned(
            top: -4,
            right: -4,
            child: BadgeContainer(itemCount: itemCount),
          ),
      ],
    );
  }
}
