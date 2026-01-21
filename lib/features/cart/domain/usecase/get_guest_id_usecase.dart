import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/cart/domain/repo_contract/cart_repo_contract.dart';

@lazySingleton
class GetGuestIdUseCase {
  final CartRepository repository;

  GetGuestIdUseCase(this.repository);

  Future<ApiResult<String>> call() {
    return repository.getGuestId();
  }
}
