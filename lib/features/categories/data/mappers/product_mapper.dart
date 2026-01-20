import 'package:trust_develpoment/features/categories/data/models/response_models/product_details/product_response.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';

extension ProductResponseMapper on ProductResponse {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      nameEn: nameEn ?? '',
      nameAr: nameAr ?? '',
      price: price ?? '',
      image: image ?? '',
      descriptionEn: descriptionEn ?? '',
      descriptionAr: descriptionAr ?? '',
    );
  }
}
