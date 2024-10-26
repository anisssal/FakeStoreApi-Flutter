
import 'package:flutter_fakestoreapi/core/services/dio_api_client.dart';

class AuthRemoteDataSource{
  final DioApiClient _dioApiClient ;
  AuthRemoteDataSource({required DioApiClient dioApiClient})  : _dioApiClient = dioApiClient ;

  Future<String> userLogIn({required String username , required String password})async{
    final Map<String, dynamic>? data = await _dioApiClient.request(
      method: RequestMethod.post,
      pathUrl: 'auth/login',
      body: {
        'username': username,
        'password': password,
      },
    );
    return data!['token'];
  }


}