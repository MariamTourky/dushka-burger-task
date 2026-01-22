import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/app/config/storage/guest_cart_storage.dart';
import 'package:trust_develpoment/features/cart/data/datasource/cart_remote_datasource_contract.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/add_to_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/cart_item_request.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/delete_from_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_response.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_item_entity.dart';
import 'package:trust_develpoment/features/cart/domain/repo_contract/cart_repo_contract.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasourceContract remote;
  final GuestCartStorage storage;

  CartRepositoryImpl(this.remote, this.storage);

  @override
  Future<ApiResult<String>> getGuestId() async {
    final cached = await storage.getGuestId();
    if (cached != null) {
      return SuccessApiResult(data: cached);
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

    if (result is SuccessApiResult<CartResponse>) {
      final data = result.data;

      return SuccessApiResult(
        data: CartEntity(
          items:
              data.items
                  ?.map(
                    (e) => CartItemEntity(
                      productId: e.productId,
                      nameEn: e.productName,
                      nameAr: e.productNameAr,
                      quantity: e.quantity,
                      image: e.image,
                      total: e.total,
                    ),
                  )
                  .toList() ??
              [],
          totalItems: data.totalItems ?? 0,
          totalPrice: data.totalPrice ?? "0",
          totalPriceWithTax: data.totalPriceWithTax ?? "0",
        ),
      );
    }

    return ErrorApiResult(error: "Failed to load cart");
  }

  @override
  Future<ApiResult<void>> addToCart(int productId, int quantity) async {
    final guestId = await getGuestId();
    if (guestId is ErrorApiResult) return guestId;

    return remote.addToCart(
      AddToCartRequest(
        guestId: (guestId as SuccessApiResult).data,
        items: [CartItemRequest(productId: productId, quantity: quantity)],
      ),
    );
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
