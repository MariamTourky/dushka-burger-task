import 'package:flutter/material.dart';
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
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hasItems ? AppColors.darkRed : AppColors.disabled,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 30,
                spreadRadius: 3,
                offset: const Offset(2, 10),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const Center(
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
