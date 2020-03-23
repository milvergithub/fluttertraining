abstract class Authentication {
  Future<String> login(String username, String password);
  Future<String> logout();
}

class LoginException implements Exception {}

class LocalAuthentication extends Authentication {
  @override
  Future<String> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (username != "admin@admin.com" || password != "123456") {
      throw LoginException();
    }
    return "ej8jhTk7bh-yI9yccTHAbjy7bg6";
  }

  @override
  Future<String> logout() async {
    return "";
  }
}