import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class DioRequest {
  final _dio = Dio();

  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);

    // 添加拦截器
    _addInterceptor();
  }

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      final data = ((await task).data) as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        return data["data"];
      }
      throw Exception(data["message"] ?? "接口异常");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<T> getFormJson<T>(
    String url, {
    required T Function(dynamic json) fromJson,
    Map<String, dynamic>? params,
  }) {
    return _handleFormJsonResponse<T>(
      _dio.get(url, queryParameters: params),
      fromJson,
    );
  }

  Future<T> _handleFormJsonResponse<T>(
    Future<Response<dynamic>> task,
    T Function(dynamic json) fromJson,
  ) async {
    try {
      final data = ((await task).data) as Map<String, dynamic>;
      if (data["code"] == GlobalConstants.SUCCESS_CODE) {
        return fromJson(data["data"]);
      }
      throw Exception(data["message"] ?? "接口异常");
    } catch (e) {
      throw Exception(e);
    }
  }
}

DioRequest dioRequest = DioRequest();
