abstract class AuthLocalDataSource {
  Future<String?> getUserToken();

  Future<void> storeUserToken(String token);
}
