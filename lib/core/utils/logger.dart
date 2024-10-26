import 'package:flutter/foundation.dart';
import 'package:flutter_fakestoreapi/core/utils/environments.dart';
import 'package:logger/logger.dart';

class _DebugFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    if (kDebugMode || Environment.debugPrint) return true;
    return false;
  }
}

final logDebug = Logger(
  filter: _DebugFilter(),
  printer: PrettyPrinter(
      methodCount: 1,
      // Number of method calls to be displayed
      errorMethodCount: 8,
      // Number of method calls if stacktrace is provided
      lineLength: 120,
      // Width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
  ),
);



