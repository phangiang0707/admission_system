import 'package:flutter/material.dart';

import 'getUser.model.dart';

class SponsorModel extends ChangeNotifier {
  Data? getUser;
  void GetUser(Data? _getUser) {
    getUser = _getUser;
    notifyListeners();
  }

  LoginOTD? getLogin;
  void loginUser(LoginOTD? _getUserOTD) {
    getLogin = _getUserOTD;
    notifyListeners();
  }
}
