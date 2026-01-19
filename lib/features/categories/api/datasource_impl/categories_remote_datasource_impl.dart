import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_manager/api_client.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/app/config/network/safe_api_call.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories_response.dart';
import 'package:trust_develpoment/features/categories/data/datasource_contract/categories_remote_datasource.dart';

@LazySingleton(as: CategoriesRemoteDatasource)
class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final ApiClient apiClient;

  CategoriesRemoteDatasourceImpl(this.apiClient);

  @override
  Future<ApiResult<List<CategoriesResponse>>> getCategories() {
    return safeApiCall(call: () => apiClient.getCategories());
  }
}
