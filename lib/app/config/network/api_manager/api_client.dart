import 'package:retrofit/retrofit.dart';
import 'package:trust_develpoment/app/core/values/app_endpoint_strings.dart';
import 'package:dio/dio.dart';
import 'package:trust_develpoment/features/categories/data/models/response_models/categories_response.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET(AppEndpointString.categories)
  Future<HttpResponse<List<CategoriesResponse>>> getCategories();
}
