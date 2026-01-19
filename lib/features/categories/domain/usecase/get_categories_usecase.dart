import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/category_entity.dart';
import 'package:trust_develpoment/features/categories/domain/repo_contract/categories_repo.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';

@lazySingleton
class GetCategoriesUseCase {
  final CategoriesRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<ApiResult<List<CategoryEntity>>> call() {
    return repository.getCategories();
  }
}
