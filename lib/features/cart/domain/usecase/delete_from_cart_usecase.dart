import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/cart/domain/repo_contract/cart_repo_contract.dart';

@lazySingleton
class DeleteFromCartUseCase {
  final CartRepository repository;

  DeleteFromCartUseCase(this.repository);

  Future<ApiResult<void>> call({
    required int productId,
    required int quantity,
  }) {
    return repository.deleteFromCart(productId, quantity);
  }
}
