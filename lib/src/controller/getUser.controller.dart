import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getUser.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class GetUserController {
  final BuildContext context;
  SponsorModel? model;
  GetUserController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<Data?> getUser() async {
    final response = await http.get(
      Uri.parse('${url}users/me'),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getUserOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
