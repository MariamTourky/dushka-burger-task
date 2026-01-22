import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/features/cart/domain/entity/add_to_cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/repo_contract/cart_repo_contract.dart';

import 'package:trust_develpoment/app/config/network/api_result.dart';

@lazySingleton
class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<ApiResult<void>> call(AddToCartEntity entity) {
    return repository.addToCart(entity);
  }
}
