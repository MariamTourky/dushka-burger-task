import 'package:injectable/injectable.dart';
import 'package:trust_develpoment/app/config/network/api_manager/api_client.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';
import 'package:trust_develpoment/app/config/network/safe_api_call.dart';
import 'package:trust_develpoment/app/config/storage/guest_cart_storage.dart';
import 'package:trust_develpoment/features/cart/data/datasource/cart_remote_datasource_contract.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/add_to_cart_request/add_to_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/delete_item_request/delete_from_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_get_response/cart_get_response.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/guest_id_response.dart';

@LazySingleton(as: CartRemoteDatasourceContract)
class CartRemoteDatasourceImpl implements CartRemoteDatasourceContract {
  final ApiClient apiClient;
  final GuestCartStorage storage;

  CartRemoteDatasourceImpl(this.apiClient, this.storage);

  @override
  Future<ApiResult<String>> getGuestId() async {
    final result = await safeApiCall(call: () => apiClient.getGuestId());
    if (result is SuccessApiResult<GuestIdResponse>) {
      await storage.saveGuestId(result.data.guestId);
      return SuccessApiResult(data: result.data.guestId);
    }
    return ErrorApiResult(error: "Failed to get guest id");
  }

  @override
  Future<ApiResult<CartGetResponse>> getCart(String guestId) {
    return safeApiCall(call: () => apiClient.getCart(guestId));
  }

  @override
  Future<ApiResult<void>> addToCart(AddToCartRequest body) {
    return safeApiCall(call: () => apiClient.addToCart(body));
  }

  @override
  Future<ApiResult<void>> deleteFromCart(DeleteFromCartRequest body) {
    return safeApiCall(call: () => apiClient.deleteFromCart(body));
  }
}
