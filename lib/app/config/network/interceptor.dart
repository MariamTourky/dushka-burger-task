import 'package:dio/dio.dart';
import 'package:trust_develpoment/app/config/storage/guest_cart_storage.dart';

class AppInterceptor extends Interceptor {
  final GuestCartStorage storage;

  AppInterceptor(this.storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final guestId = await storage.getGuestId();
    if (guestId != null && guestId.isNotEmpty) {
      options.headers['Authorization'] = 'Basic $guestId';
    }
    super.onRequest(options, handler);
  }
}
