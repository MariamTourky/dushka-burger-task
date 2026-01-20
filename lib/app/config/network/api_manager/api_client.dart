import 'package:retrofit/retrofit.dart';
import 'package:trust_develpoment/app/core/values/app_endpoint_strings.dart';
import 'package:dio/dio.dart';
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
  Future<HttpResponse<ProductResponse>> getProductDetails(
    @Query("product_id") int productId,
  );

  @GET(AppEndpointString.productAddons)
  Future<HttpResponse<ProductAddonsResponse>> getProductAddons(
    @Query("product_id2") int productId,
  );
}
