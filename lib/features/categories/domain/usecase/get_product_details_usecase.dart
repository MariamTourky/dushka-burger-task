import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/product_entity.dart';
import 'package:trust_develpoment/features/categories/domain/repo_contract/categories_repo.dart';

@lazySingleton
class GetProductDetailsUseCase {
  final CategoriesRepository repository;

  GetProductDetailsUseCase(this.repository);

  Future<ApiResult<ProductEntity>> call(int productId) {
    return repository.getProductDetails(productId);
  }
}
