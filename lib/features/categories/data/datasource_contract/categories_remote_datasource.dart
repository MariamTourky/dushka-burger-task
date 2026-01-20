import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories_response.dart';

abstract class CategoriesRemoteDatasource {
  Future<ApiResult<List<CategoriesResponse>>> getCategories();
}
