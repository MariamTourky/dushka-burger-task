import 'package:flutter/material.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _skeletonBox(height: 250),
        const SizedBox(height: 16),
        _skeletonBox(height: 24, width: 180),
        const SizedBox(height: 12),
        _skeletonBox(height: 20, width: 120),
        const SizedBox(height: 24),
        _skeletonBox(height: 16),
        const SizedBox(height: 8),
        _skeletonBox(height: 16),
      ],
    );
  }

  Widget _skeletonBox({double height = 16, double? width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
