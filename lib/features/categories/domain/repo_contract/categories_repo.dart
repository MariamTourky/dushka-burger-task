import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';

abstract class CategoriesRepository {
  Future<ApiResult<List<CategoryEntity>>> getCategories();

  Future<ApiResult<ProductEntity>> getProductDetails(int productId);
  Future<ApiResult<List<AddonBlockEntity>>> getProductAddons(int productId);
}
