import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/getPaymentStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';

class PostPaymentController {
  final BuildContext context;
  SponsorModel? model;
  PostPaymentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }

  Future<GetPaymentStudentOtd?> postPaymentController(String id) async {
    final response = await http.post(
      Uri.parse('${url}payments'),
      body: jsonEncode({"studentId": id}),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return getPaymentStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
