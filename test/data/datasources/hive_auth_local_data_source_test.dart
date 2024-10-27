import 'package:flutter_fakestoreapi/core/exceptions/api_exception.dart';
import 'package:flutter_fakestoreapi/core/utils/contants.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_local_data_source.dart';
import 'package:flutter_fakestoreapi/data/datasources/hive_auth_local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hive_auth_local_data_source_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late HiveInterface hiveInterface;
  late AuthLocalDataSource localDataSource;
  late MockBox keyPairBox;

  setUp(() {
    hiveInterface = MockHiveInterface();
    localDataSource = HiveAuthLocalDataSourceImpl(hiveInterface: hiveInterface);
    keyPairBox = MockBox();
  });





  group('''
    Perform getUserToken from local Data Source
  ''', () {
    test('''
        should return string token successfully
      ''', () async {
      const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsInVzZXIiOiJqb2huZCIsImlhdCI6MTczMDAxNDc5MH0.r53K9fpLISrAwvOZB6_NalcZoVBmt4L-Vi0MJ3wStHU';
      when(hiveInterface.openBox(Constants.fakestoreapiKey))
          .thenAnswer((_) async => keyPairBox);
      when(keyPairBox.get(Constants.userTokenKey)).thenAnswer((_) => token);

      expect(await localDataSource.getUserToken(),token);
    });

    test('''
        should throw UnknownException if exception happen
      ''', () async {
      when(hiveInterface.openBox(Constants.fakestoreapiKey))
          .thenAnswer((_) async => keyPairBox);
      when(keyPairBox.get(Constants.userTokenKey)).thenThrow(Exception());

      expect(() => localDataSource.getUserToken(),
          throwsA(const TypeMatcher<UnknownException>()));
    });

  });


  group('''
    Perform storeUserToken on local Data Source
  ''', () {
    const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsInVzZXIiOiJqb2huZCIsImlhdCI6MTczMDAxNDc5MH0.r53K9fpLISrAwvOZB6_NalcZoVBmt4L-Vi0MJ3wStHU';

    test('''
        should pass successfully if no exception
      ''', () async {
      when(hiveInterface.openBox(Constants.fakestoreapiKey))
          .thenAnswer((_) async => keyPairBox);
      when(keyPairBox.put(Constants.userTokenKey, token)).thenAnswer((_) async=> 1);
      await localDataSource.storeUserToken(token);
      verify(keyPairBox.put(Constants.userTokenKey, token));
    });

    test('''
        should throw UnknownException if exception happen
      ''', () async {
      when(hiveInterface.openBox(Constants.fakestoreapiKey))
          .thenThrow(Exception('Failed to open box'));
      when(keyPairBox.put(Constants.userTokenKey, token)).thenThrow(Exception());

      expect(() => localDataSource.storeUserToken(token),
          throwsA(const TypeMatcher<UnknownException>()));
      // expect(
      //       () => keyPairBox.put(Constants.userTokenKey, token),
      //   throwsA(isA<UnknownException>()),
      // );





    });

  });



}
