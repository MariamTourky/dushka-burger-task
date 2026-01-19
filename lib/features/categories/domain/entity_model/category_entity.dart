import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';

class CategoryEntity {
  final int id;
  final String name;
  final String image;
  final List<ProductEntity> products;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });
}
