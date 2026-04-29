
import 'package:get_secure_storage/get_secure_storage.dart';
class LocalStorage {
  final _storage =  GetSecureStorage();

  Future<void> saveVariable(String key, String value) async {
    await _storage.write( key,  value);
  }
  Future<void> saveBoolVariable(String key, bool value) async {
    await _storage.write( key,  value);
    
  }
  Future<String?> getVarable(String key) async {
    return _storage.read( key);
  }
    Future<bool?> getBoolVarable(String key) async {
    return _storage.read( key);
  }

 

  Future<void> remove(String key) async {
  await _storage.remove(key);
}

}

