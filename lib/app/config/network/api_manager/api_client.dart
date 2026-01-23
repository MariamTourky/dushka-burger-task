import 'package:retrofit/retrofit.dart';
import 'package:trust_develpoment/app/core/values/app_endpoint_strings.dart';
import 'package:dio/dio.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/add_to_cart_request/add_to_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/request_models/delete_item_request/delete_from_cart_request.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/cart_get_response/cart_get_response.dart';
import 'package:trust_develpoment/features/cart/data/models/response_model/guest_id_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories/categories_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_addons/product_addons_response.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/product_details/product_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET(AppEndpointString.categories)
  Future<HttpResponse<List<CategoriesResponse>>> getCategories();

  @GET(AppEndpointString.productDetails)
  Future<HttpResponse<List<ProductResponse>>> getProductDetails(
    @Query("product_id") int productId,
  );

  @GET(AppEndpointString.productAddons)
  Future<HttpResponse<ProductAddonsResponse>> getProductAddons(
    @Query("product_id2") int productId,
  );
  @GET(AppEndpointString.guestId)
  Future<HttpResponse<GuestIdResponse>> getGuestId();

  @GET(AppEndpointString.cart)
  Future<HttpResponse<CartGetResponse>> getCart(
    @Query("guest_id") String guestId,
  );

  @POST(AppEndpointString.cart)
  Future<HttpResponse<void>> addToCart(@Body() AddToCartRequest body);

  @DELETE(AppEndpointString.cart)
  Future<HttpResponse<void>> deleteFromCart(@Body() DeleteFromCartRequest body);
}
