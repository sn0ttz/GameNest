import 'package:hive/hive.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<void> insertUser(
      String username, String email, String password) async {
    final box = await Hive.openBox('users');
    await box.put(username, {'email': email, 'password': password});
  }

  Future<Map<String, dynamic>?> getUser(
      String username, String password) async {
    final box = await Hive.openBox('users');
    final user = box.get(username);
    if (user != null && user['password'] == password) {
      return user;
    }
    return null;
  }
}
