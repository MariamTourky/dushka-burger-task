import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trust_develpoment/app/core/ui_helper/color/colors.dart';

class ShimmerList extends StatelessWidget {
  final Axis scrollDirection;
  final double itemWidth;
  final double itemHeight;

  const ShimmerList({
    super.key,
    this.scrollDirection = Axis.vertical,
    required this.itemWidth,
    required this.itemHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: scrollDirection,
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      separatorBuilder: (_, _) => SizedBox(
        width: scrollDirection == Axis.horizontal ? 12 : 0,
        height: scrollDirection == Axis.vertical ? 16 : 0,
      ),
      itemBuilder: (_, _) => Shimmer.fromColors(
        baseColor: AppColors.surface,
        highlightColor: AppColors.disabled,
        child: Container(
          width: itemWidth,
          height: itemHeight,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
