import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';

class CategoryEntity {
  final int id;
  final String nameEn;
  final String nameAr;
  final String image;
  final List<ProductEntity> products;

  const CategoryEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.products,
  });

  String dataByLocale(String locale) {
    return locale == 'ar' ? nameAr : nameEn;
  }
}
