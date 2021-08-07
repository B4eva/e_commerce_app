import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreference {
  static SharedPreferences? _preferences;

  static const _keyUserEmail = 'email';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserEmail(String userEmail) async =>
      await _preferences!.setString(_keyUserEmail, userEmail);

  static String? getUserEmail() => _preferences!.getString(_keyUserEmail);
}
