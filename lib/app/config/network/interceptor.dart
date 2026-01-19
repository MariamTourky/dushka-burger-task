import 'package:dio/dio.dart';
import 'package:trust_develpoment/app/config/storage/guest_cart_storage.dart';

class AppInterceptor extends Interceptor {
  final GuestCartStorage storage;
  AppInterceptor(this.storage);
}
