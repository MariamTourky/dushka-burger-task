import 'package:trust_develpoment/features/categories/data/mappers/product_mapper.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories/categories_response.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';

extension CategoriesResponseMapper on CategoriesResponse {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id ?? 0,
      nameEn: nameEn ?? '',
      nameAr: nameAr ?? '',
      image: image ?? '',
      products: (products ?? []).map((p) => p.toEntity()).toList(),
    );
  }
}
