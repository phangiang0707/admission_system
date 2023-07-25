import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/getDetailStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';

class PostConfirmController {
  final BuildContext context;
  SponsorModel? model;
  PostConfirmController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }

  Future<GetDetailStudentOtd?> postConfirmController(String id) async {
    final response = await http.post(
      Uri.parse('${url}students/confirm'),
      body: jsonEncode({"studentId": id, "checked": true}),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return getDetailStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
