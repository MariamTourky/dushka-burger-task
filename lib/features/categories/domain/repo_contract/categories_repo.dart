import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';

abstract class CategoriesRepository {
  Future<ApiResult<List<CategoryEntity>>> getCategories();
}
