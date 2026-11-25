class ApiConstants {
  // Android emulator : 10.0.2.2
  // iOS simulator    : 127.0.0.1
  // HP asli / LAN    : IP laptop kamu (contoh 10.205.254.206)
  static const String baseUrl = 'http://10.205.254.206:8000/api';

  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String user = '$baseUrl/user';
  static const String postsEndpoint = '/posts';
  static const String articles = '$baseUrl/articles';
}