

import 'dart:convert';

import 'package:flutter_fakestoreapi/core/services/dio_api_client.dart';
import 'package:flutter_fakestoreapi/core/utils/environments.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixtures_reader.dart';
import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([DioApiClient])
void main() {
  late DioApiClient apiClient;
  late AuthRemoteDataSource dataSource;

  setUp(()async{
    apiClient = MockDioApiClient();
    dataSource = AuthRemoteDataSource(dioApiClient: apiClient);
    await Environment.initEnvironment(flavor: 'development');

  });


  group('''
    Perform userLogIn from remote datasource
  ''', () {
    test('''
        should response success with token  
      ''', () async {
      final response = jsonDecode(fixture('login/login_response.json'));
      const username = "johnd";
      const password = "m38rmF\$";
      when(apiClient.request(method: RequestMethod.post, pathUrl: 'auth/login',
          body: {
            'username': username,
            'password': password,
          }))
          .thenAnswer((_) => Future.value(response ));

      final result = await dataSource.userLogIn(username: username, password: password);

      const expectedResult = 'eyJhbGciOiJIUzI1NiIsInR';
      expect(expectedResult, result);
    });


  });

}