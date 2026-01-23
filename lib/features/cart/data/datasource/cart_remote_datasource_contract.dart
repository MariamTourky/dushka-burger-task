import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/add_to_cart_request/add_to_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/delete_item_request/delete_from_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_get_response/cart_get_response.dart';

abstract class CartRemoteDatasourceContract {
  Future<ApiResult<String>> getGuestId();
  Future<ApiResult<CartGetResponse>> getCart(String guestId);
  Future<ApiResult<void>> addToCart(AddToCartRequest body);
  Future<ApiResult<void>> deleteFromCart(DeleteFromCartRequest body);
}
