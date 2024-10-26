import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  const Environment._();
  static Future initEnvironment ({required String flavor}) async{
    await dotenv.load(fileName: '.env.$flavor');

  }
  static bool get isDev => dotenv.env['ENV_NAME'] != 'production';

  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://fakestoreapi.com/';

  static bool get debugPrint => dotenv.env['DEBUG_PRINT'] == 'true';

  static String get apiAppID => dotenv.env['API_APP_ID'] ?? '';


}
