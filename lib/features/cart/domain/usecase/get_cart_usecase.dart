import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/repo_contract/cart_repo_contract.dart';

import 'package:trust_develpoment/app/config/network/api_result.dart';

@lazySingleton
class GetCartUseCase {
  final CartRepository repository;

  GetCartUseCase(this.repository);

  Future<ApiResult<CartEntity>> call() {
    return repository.getCart();
  }
}
