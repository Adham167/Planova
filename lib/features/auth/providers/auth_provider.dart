import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String? _resetEmail;

  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get resetEmail => _resetEmail;

  Future<void> login() async {
    setLoading(true);
    
    await Future.delayed(const Duration(seconds: 2));
    
    _isLoggedIn = true;
    setLoading(false);
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setResetEmail(String email) {
    _resetEmail = email;
    notifyListeners();
  }
}