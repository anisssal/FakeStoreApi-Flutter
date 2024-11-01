// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_fakestoreapi/test/data/datasources/auth_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_fakestoreapi/core/services/dio_api_client.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [DioApiClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioApiClient extends _i1.Mock implements _i2.DioApiClient {
  MockDioApiClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<Map<String, dynamic>?> request({
    required _i2.RequestMethod? method,
    required String? pathUrl,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    bool? writeLog = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [],
          {
            #method: method,
            #pathUrl: pathUrl,
            #body: body,
            #queryParameters: queryParameters,
            #headers: headers,
            #writeLog: writeLog,
          },
        ),
        returnValue: _i3.Future<Map<String, dynamic>?>.value(),
      ) as _i3.Future<Map<String, dynamic>?>);
}
