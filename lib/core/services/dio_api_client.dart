import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../exceptions/api_exception.dart';
import '../utils/environments.dart';
import '../utils/network_utils.dart';


class DioApiClient{
  final Dio _dio;

  const DioApiClient({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>?> request(
      { required RequestMethod method,
        required String pathUrl,
        Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
        bool writeLog = false}) async {
    if (method == RequestMethod.post) {
      _dio.options.headers['content-Type'] = 'application/json';
    }

    try {
      final Response<dynamic> res = await _dio.request(
        '${Environment.baseUrl}$pathUrl',
        data: body,
        queryParameters: queryParameters,
        options: Options(
          method: method.value,
          headers: headers,
        ),
      );
      return handleResponse(res);
    } catch (error) {
      if (error is DioException &&
          error.error is SocketException &&
          !await NetworkUtils.isConnected()) {
        throw NoInternetException();
      }
      throw handleError(error);
    }
  }
}
Future<Map<String, dynamic>?> handleResponse(Response<dynamic> res) async {
  Map<String, dynamic> response = <String, dynamic>{};
  try {
    if(res.data==null) return null;
    if (res.data is List<dynamic>) {
      Map<String, dynamic> map = {
        'data': jsonDecode(res.toString()) as List<dynamic>
      };
      response = map;
    } else {
      response = res.data as Map<String, dynamic>;
    }
  } on FormatException catch (_) {
    Map<String, dynamic> map = {'data': res.data as List<dynamic>};
    response = map;
  } on TypeError catch (_) {
    Map<String, dynamic> map = {'data': res.data as List<dynamic>};
    response = map;
  }

  if (res.statusCode == 200) {
    return response;
  } else {
    throw ServerErrorException();
  }
}



Object handleError(Object error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw TimeoutException();
      case DioExceptionType.connectionError:
        throw ServerErrorException();
      case DioExceptionType.badCertificate:
        throw ServerErrorException();
      case DioExceptionType.cancel:
      // TODO: Handle this case.
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
      case DioExceptionType.unknown:
      throw UnknownException();
    }
  } else {
    throw ServerErrorException();
  }
}


enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}
extension RequestMethodX on RequestMethod {
  String get value => toString().split('.').last.toUpperCase();
}

