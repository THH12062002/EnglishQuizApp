// ignore_for_file: type_annotate_public_apis, deprecated_member_use
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';

class Api {
  static Dio _createDio({
    Options? customOptions,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) {
    final dio = Dio(
      BaseOptions(
        receiveTimeout: const Duration(seconds: 15), // 15 seconds
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    dio.interceptors.addAll({
      CurlLoggerDioInterceptor(
        printOnSuccess: true,
      ),
      // Thêm interceptor để xử lý mã trạng thái
      InterceptorsWrapper(
        onResponse: (response, handler) {
          if (response.statusCode == 567) {
            // Xử lý khi gặp mã trạng thái 567 ở đây
            // Ví dụ: ném ra một ngoại lệ, hoặc xử lý khác
            throw DioError(
              requestOptions: response.requestOptions,
              error:
                  "Server error - the server failed to fulfil an apparently valid request",
              response: response,
            );
          }
          return handler.next(response);
        },
      ),
    });

    return dio;
  }

  // Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).get(
        url,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).post(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).put(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Patch:-----------------------------------------------------------------------
  Future<Response> patch(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).patch(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<Response> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? customOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool hasToken = false,
    bool isAutoLogout = true,
  }) async {
    try {
      final Response response = await _createDio(
        customOptions: customOptions,
        hasToken: hasToken,
        isAutoLogout: isAutoLogout,
      ).delete(
        url,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
