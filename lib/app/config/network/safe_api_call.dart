import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trust_develpoment/app/config/network/api_result.dart';

Future<ApiResult<T>> safeApiCall<T>({
  required Future<HttpResponse<T>> Function() call,
}) async {
  try {
    final response = await call();
    return SuccessApiResult(data: response.data);
  } on DioException catch (e) {
    return ErrorApiResult(error: e.message ?? 'Dio error');
  } catch (e) {
    return ErrorApiResult(error: "Unexpected error: $e");
  }
}
