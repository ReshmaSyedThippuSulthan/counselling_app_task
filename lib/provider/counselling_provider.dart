import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounsellingProvider extends ChangeNotifier {
  String? token;
  Role? role;
  String? get Token => token;
  Role? get TypeRole => role;
  void setToken(String value) {
    token = value;
    notifyListeners();
  }

  void setRole(Role roleValue) {
    role = roleValue;
    notifyListeners();
  }
}

enum Role { student, agent }
