import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/app/config/storage/guest_cart_storage.dart';
import 'package:trust_develpoment/features/cart/data/datasource/cart_remote_datasource_contract.dart';
import 'package:trust_develpoment/features/cart/data/mappers/to_entity/cart_response_mapper.dart';
import 'package:trust_develpoment/features/cart/data/mappers/to_request/add_to_cart_request_mapper.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/delete_item_request/delete_from_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_get_response/cart_get_response.dart';
import 'package:trust_develpoment/features/cart/domain/entity/add_to_cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/repo_contract/cart_repo_contract.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasourceContract remote;
  final GuestCartStorage storage;

  CartRepositoryImpl(this.remote, this.storage);

  @override
  Future<ApiResult<String>> getGuestId() async {
    final stored = await storage.getGuestId();
    if (stored != null) {
      return SuccessApiResult(data: stored);
    }
    return remote.getGuestId();
  }

  @override
  Future<ApiResult<CartEntity>> getCart() async {
    final guestId = await storage.getGuestId();
    if (guestId == null) {
      return ErrorApiResult(error: "Guest not initialized");
    }

    final result = await remote.getCart(guestId);

    if (result is SuccessApiResult<CartGetResponse>) {
      return SuccessApiResult(data: result.data.toEntity());
    }

    return ErrorApiResult(error: "Failed to load cart");
  }

  @override
  Future<ApiResult<void>> addToCart(AddToCartEntity entity) async {
    final guestIdResult = await getGuestId();
    if (guestIdResult is ErrorApiResult) return guestIdResult;

    final entityWithGuest = AddToCartEntity(
      guestId: (guestIdResult as SuccessApiResult<String>).data,
      items: entity.items,
    );

    return remote.addToCart(entityWithGuest.toRequest());
  }

  @override
  Future<ApiResult<void>> deleteFromCart(int productId, int quantity) async {
    final guestId = await storage.getGuestId();
    if (guestId == null) {
      return ErrorApiResult(error: "Guest not initialized");
    }

    return remote.deleteFromCart(
      DeleteFromCartRequest(
        guestId: guestId,
        productId: productId.toString(),
        quantity: quantity,
      ),
    );
  }
}
