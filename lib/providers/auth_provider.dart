import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  // LOGIN
  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _authService.login(email, password);
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  // REGISTER
  Future<void> register(String fullName, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _authService.register(fullName, email, password);
    } catch (e) {
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  // LOGOUT
  void logout() {
    _user = null;
    notifyListeners();
  }
}