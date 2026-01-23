import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:trust_develpoment/app/config/network/api_manager/api_client.dart';
import 'package:trust_develpoment/app/config/storage/guest_cart_storage.dart';
import 'package:trust_develpoment/app/core/values/app_endpoint_strings.dart';

@module
abstract class NetworkModule {
  static const _username = 'testapp';
  static const _password = '5S0Q YjyH 4s3G elpe 5F8v u8as';

  @lazySingleton
  GuestCartStorage guestCartStorage() => GuestCartStorage();

  @lazySingleton
  Dio dio() {
    final basicAuth = base64Encode(utf8.encode('$_username:$_password'));
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEndpointString.baseUrl,
        headers: {'Authorization': 'Basic $basicAuth'},
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(requestHeader: true, error: true, compact: true),
    );
    return dio;
  }

  @lazySingleton
  ApiClient apiClient(Dio dio) {
    return ApiClient(dio, baseUrl: AppEndpointString.baseUrl);
  }
}
