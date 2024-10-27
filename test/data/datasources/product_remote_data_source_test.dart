
import 'dart:convert';

import 'package:flutter_fakestoreapi/core/services/dio_api_client.dart';
import 'package:flutter_fakestoreapi/core/utils/environments.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/data/datasources/product_remote_data_source.dart';
import 'package:flutter_fakestoreapi/data/dto/product_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:collection/collection.dart';

import '../../fixtures/fixtures_reader.dart';
import 'auth_remote_data_source_test.mocks.dart';

@GenerateMocks([DioApiClient])
void main() {
  late DioApiClient apiClient;
  late ProductRemoteDataSource dataSource;

  setUp(()async{
    apiClient = MockDioApiClient();
    dataSource = ProductRemoteDataSource(dioApiClient: apiClient);
    await Environment.initEnvironment(flavor: 'development');

  });


  group('''
    Perform getProducts from remote datasource
  ''', () {
    test('''
        should response success with product-items 
      ''', () async {
      final response = jsonDecode(fixture('product/products_response.json'));

      when(apiClient.request(method: RequestMethod.get, pathUrl: 'products',))
          .thenAnswer((_) => Future.value({ "data" : response} ));

      final result = await dataSource.getProducts();
      logDebug.i(result);
      final expected = [
        ProductDTO(
          id: 1 ,
          title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          price: 109.95,
          description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category: "men's clothing",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          rating: ProductRatingDTO(
            count: 120,
            rate: 3.9
          )
        ),
        ProductDTO(
            id: 2 ,
            title: "Mens Casual Premium Slim Fit T-Shirts ",
            price: 22.3,
            description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
            category: "men's clothing",
            image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
            rating: ProductRatingDTO(
                count: 259,
                rate: 4.1
            )
        )
      ];
      final bool equal = const ListEquality().equals(result, expected);
      expect(equal, true);
    });

    test('''
        should return empty list when response is null 
      ''', () async {

      when(apiClient.request(method: RequestMethod.get, pathUrl: 'products',))
          .thenAnswer((_) => Future.value(null ));

      final result = await dataSource.getProducts();
      expect([], result);
    });
  });

  group('''
    Perform getProduct from remote datasource
  ''', () {
      test('''
        should response success with products  
      ''', () async {
      final response = jsonDecode(fixture('product/product_response.json'));
      const id = 1 ;
      when(apiClient.request(method: RequestMethod.get, pathUrl: 'products/$id',))
          .thenAnswer((_) => Future.value(response ));

      final result = await dataSource.getProductById(id);
      final expected =    ProductDTO(
          id: 2 ,
          title: "Mens Casual Premium Slim Fit T-Shirts ",
          price: 22.3,
          description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
          category: "men's clothing",
          image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
          rating: ProductRatingDTO(
              count: 259,
              rate: 4.1
          )
      );

      expect(expected, result);
    });


  });

}