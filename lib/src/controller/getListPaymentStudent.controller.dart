import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getListPaymentsStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class GetListPaymentStudentController {
  final BuildContext context;
  SponsorModel? model;
  GetListPaymentStudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<List<GetListPaymentStudentOtd>?> getListPaymentStudent() async {
    final response = await http.get(
      Uri.parse('${url}payments'),
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
