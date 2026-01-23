import 'package:shared_preferences/shared_preferences.dart';

class GuestCartStorage {
  static const _keyGuestId = 'guest_id';

  Future<void> saveGuestId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyGuestId, id);
  }

  Future<String?> getGuestId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyGuestId);
  }
}
