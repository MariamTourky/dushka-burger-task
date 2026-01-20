import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/categories/domain/entity_model/addons_block_entity.dart';
import 'package:trust_develpoment/features/categories/domain/repo_contract/categories_repo.dart';

@lazySingleton
class GetProductAddonsUseCase {
  final CategoriesRepository repository;

  GetProductAddonsUseCase(this.repository);

  Future<ApiResult<List<AddonBlockEntity>>> call(int productId) {
    return repository.getProductAddons(productId);
  }
}
