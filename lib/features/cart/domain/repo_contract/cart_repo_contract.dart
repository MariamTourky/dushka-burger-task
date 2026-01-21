import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/cart/domain/entity/cart_entity.dart';

abstract class CartRepository {
  Future<ApiResult<String>> getGuestId();
  Future<ApiResult<CartEntity>> getCart();
  Future<ApiResult<void>> addToCart(int productId, int quantity);
  Future<ApiResult<void>> deleteFromCart(int productId, int quantity);
}
