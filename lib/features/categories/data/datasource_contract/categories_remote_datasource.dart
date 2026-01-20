import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories/categories_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/product_addons_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_details/product_response.dart';

abstract class CategoriesRemoteDatasource {
  Future<ApiResult<List<CategoriesResponse>>> getCategories();
  Future<ApiResult<ProductResponse>> getProductDetails(int productId);
  Future<ApiResult<ProductAddonsResponse>> getProductAddons(int productId);
}
