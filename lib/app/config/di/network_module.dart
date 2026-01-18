import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:trust_develpoment/app/config/network/interceptor.dart';
import 'package:trust_develpoment/app/config/storage/guest_cart_storage.dart';
import 'package:trust_develpoment/app/core/values/app_endpoint_strings.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  GuestCartStorage guestCartStorage() => GuestCartStorage();

  @lazySingleton
  AppInterceptor interceptor(GuestCartStorage storage) {
    return AppInterceptor(storage);
  }

  @lazySingleton
  Dio dio(AppInterceptor interceptor) {
    final dio = Dio(BaseOptions(baseUrl: AppEndpointString.baseUrl));

    dio.interceptors.add(interceptor);

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
    );

    return dio;
  }
  //
  // @lazySingleton
  // ApiClient apiClient(Dio dio) {
  //   return ApiClient(dio, baseUrl: AppEndpointString.baseUrl);
  // }
}

