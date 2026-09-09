import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/app_user.dart';
import '../navigation/app_tabs.dart';
import 'user_repository.dart';

/// Simple local session: current user id in SharedPreferences.
class AuthSession extends ChangeNotifier {
  AuthSession._();
  static final AuthSession instance = AuthSession._();

  static const _userIdKey = 'current_user_id';

  AppUser? _user;
  bool _ready = false;

  AppUser? get user => _user;
  bool get isLoggedIn => _user != null;
  bool get isReady => _ready;

  Future<void> restore() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getInt(_userIdKey);
      if (id != null) {
        _user = await UserRepository.instance.findById(id);
      }
    } catch (_) {
      _user = null;
    } finally {
      _ready = true;
      notifyListeners();
    }
  }

  Future<void> login(AppUser user) async {
    _user = user;
    _ready = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_userIdKey, user.id);
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    appTabIndex.value = 0;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    notifyListeners();
  }
}
