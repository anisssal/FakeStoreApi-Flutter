import 'package:flutter_fakestoreapi/core/services/dio_api_client.dart';
import 'package:flutter_fakestoreapi/data/dto/product_dto.dart';

class ProductRemoteDataSource{
  final DioApiClient _dioApiClient ;
  ProductRemoteDataSource({required DioApiClient dioApiClient})  : _dioApiClient = dioApiClient ;


  Future<List<ProductDTO>> getProducts()async{
    final Map<String, dynamic>? data = await _dioApiClient.request(
      method: RequestMethod.get,
      pathUrl: 'products',
    );
    if (data == null) return [];
    return (data['data'] as List<dynamic>)
        .map((d) => ProductDTO.fromJson(d as Map<String, dynamic>))
        .toList();
  }

  Future<ProductDTO?> getProductById(int id)async{
    final Map<String, dynamic>? data = await _dioApiClient.request(
      method: RequestMethod.get,
      pathUrl: 'products/$id',
    );
    if (data == null) return null;
    return ProductDTO.fromJson(data);
  }


}