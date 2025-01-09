import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String _username = '';
  String _email = '';

  String get username => _username;
  String get email => _email;

  void setUser(String username, String email) {
    _username = username;
    _email = email;
    notifyListeners(); // Notifies the UI to rebuild whenever the data changes
  }
}
