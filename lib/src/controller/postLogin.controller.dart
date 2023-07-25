import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getUser.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class LoginControllerr {
  final BuildContext context;
  SponsorModel? model;
  LoginControllerr({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<LoginOTD?> loginUser(String email, String pass) async {
    var response = await http.post(Uri.parse('${url}auth/login'),
        body: {"email": email, "password": pass});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      return loginFromJson(response.body);
    } else {
      print('Error');
      return null;
    }
  }
}
