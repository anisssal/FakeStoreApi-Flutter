import 'package:flutter_fakestoreapi/core/exceptions/api_exception.dart';
import 'package:flutter_fakestoreapi/core/utils/contants.dart';
import 'package:flutter_fakestoreapi/core/utils/logger.dart';
import 'package:flutter_fakestoreapi/data/datasources/auth_local_data_source.dart';
import 'package:hive/hive.dart';

class HiveAuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String tag = 'HiveAuthLocalDataSourceImpl';



  final HiveInterface hiveInterface;
  HiveAuthLocalDataSourceImpl({
    required this.hiveInterface,
  });




  @override
  Future<String?> getUserToken()async {
    try {
      var box = await hiveInterface.openBox(Constants.fakestoreapiKey);
      var token = box.get(Constants.userTokenKey) as String?;
      logDebug.i('$tag getUserToken ');
      return token;
    } catch (e) {
      logDebug.e('$tag getUserToken', error: e);
      throw UnknownException();
    }

  }

  @override
  Future<void> storeUserToken(String token) async{
    try {
      var box = await hiveInterface.openBox(Constants.fakestoreapiKey);
      box.put(Constants.userTokenKey, token);
      logDebug.i('$tag storeUserToken ');
    } catch (e) {
      logDebug.e('$tag storeUserToken', error: e);
    }

  }

}
