import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_manager/api_client.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/app/config/network/safe_api_call.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories/categories_response.dart';
import 'package:trust_develpoment/features/categories/data/datasource_contract/categories_remote_datasource.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/product_addons_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_details/product_response.dart';

@LazySingleton(as: CategoriesRemoteDatasource)
class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final ApiClient apiClient;

  CategoriesRemoteDatasourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<CategoriesResponse>>> getCategories() {
    return safeApiCall(call: () => apiClient.getCategories());
  }

  @override
  Future<ApiResult<List<ProductResponse>>> getProductDetails(int productId) {
    return safeApiCall(call: () => apiClient.getProductDetails(productId));
  }

  @override
  Future<ApiResult<ProductAddonsResponse>> getProductAddons(int productId) {
    return safeApiCall(call: () => apiClient.getProductAddons(productId));
  }
}
