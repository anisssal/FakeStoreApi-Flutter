// Define an interceptor that logs the requests and responses
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Define an interceptor that logs the requests and responses
class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';

    // Log the error request and error message
    _logDebug('onError: ${options.method} request => $requestPath',
        level: Level.error);
    _logDebug('onError: ${err.error}, Message: ${err.message}',
        level: Level.debug);

    // Call the super class to continue handling the error
    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    // Log request details
    _logDebug(
        '\n\n\n.........................................................................');
    _logDebug('onRequest: ${options.method} => $requestPath',
        level: Level.info);
    if (options.headers.isNotEmpty) {
      _logDebug('onRequest: Request Headers => ${options.headers}',
          level: Level.info);
    }
    if (options.queryParameters.isNotEmpty) {
      _logDebug('onRequest: Request Param => ${options.queryParameters}',
          level: Level.info);
    }
    if (options.data != null) {
      _logDebug('onRequest: Request Data => ${_prettyJsonEncode(options.data)}',
          level: Level.info); // Log formatted request data
    }

    // Call the super class to continue handling the request
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final requestPath =
        '${response.requestOptions.baseUrl}${response.requestOptions.path}';

    // Log the response status code and data
    _logDebug(
        'onResponse: ${response.requestOptions.method} => $requestPath \nStatusCode: ${response.statusCode}, \nData: ${_prettyJsonEncode(response.data)}',
        level: Level.debug); // Log formatted response data
    _logDebug(
        '.........................................................................\n\n');

    // Call the super class to continue handling the response
    return super.onResponse(response, handler);
  }

  // Helper method to convert data to pretty JSON format
  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}

void _logDebug(String message, {Level level = Level.info}) {
  // Define ANSI escape codes for different colors
  const String resetColor = '\x1B[0m';
  const String redColor = '\x1B[31m'; // Red
  const String greenColor = '\x1B[32m'; // Green
  const String yellowColor = '\x1B[33m'; // Yellow
  const String cyanColor = '\x1B[36m'; // Cyan

  // Get the current time in hours, minutes, and seconds
  final now = DateTime.now();
  final timeString =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

  // Only log messages if the app is running in debug mode
  if (kDebugMode) {
    try {
      String logMessage;
      switch (level) {
        case Level.debug:
          logMessage = '$cyanColor[DEBUG][$timeString] $message$resetColor';
          break;
        case Level.info:
          logMessage = '$greenColor[INFO][$timeString] $message$resetColor';
          break;
        case Level.warning:
          logMessage =
              '$yellowColor[WARNING][$timeString] $message $resetColor';
          break;
        case Level.error:
          logMessage = '$redColor[ERROR][$timeString] $message $resetColor';
          break;
        case Level.alien:
          logMessage = '$redColor[ALIEN][$timeString] $message $resetColor';
          break;
      }
      //print(logMessage);
      // Use the DebugPrintCallback to ensure long strings are not truncated
      debugPrint(logMessage);
    } catch (e) {
      print(e.toString());
    }
  }
}

enum Level { debug, info, warning, error, alien }

