import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getPaymentStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class GetPaymentStudentController {
  final BuildContext context;
  SponsorModel? model;
  GetPaymentStudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }

  Future<GetPaymentStudentOtd?> getStudent(String id) async {
    final response = await http.get(
      Uri.parse('${url}payments/byStudent?studentId=${id}'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getPaymentStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
