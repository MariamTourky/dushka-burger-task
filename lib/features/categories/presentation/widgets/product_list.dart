import 'package:flutter/material.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';
import 'package:trust_develpoment/features/categories/presentation/widgets/product_item_widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItemWidget(product: product);
      },
    );
  }
}
