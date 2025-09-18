import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _userId = 'auth_token';

  Future<void> saveToken(String userId) async {
    await _storage.write(key: _userId, value: userId);
  }

  Future<String?> getUserToken() async {
    return await _storage.read(key: _userId);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _userId);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}
