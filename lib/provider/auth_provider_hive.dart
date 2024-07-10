import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthProviderHive extends ChangeNotifier {
  Box _authBox = Hive.box("authBox");
  // ignore: non_constant_identifier_names
  // AuthProvider() {
  //   _authBox = Hive.box("authBox");
  //   notifyListeners();
  // }

  dynamic get authCredential => _authBox.get("authCredential");

  void savedCredential(Map<String, dynamic> data) {
    print("data dari parameter: $data");
    _authBox.put("authCredential", data);
    notifyListeners();
  }

  void clearToken() {
    _authBox.delete('authCredential');
    notifyListeners();
  }
}
