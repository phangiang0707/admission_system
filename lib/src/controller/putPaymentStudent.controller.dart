import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../model/getPaymentStudent.model.dart';
import '../model/putPaymentStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';

class PutPaymentStudentController {
  final BuildContext context;
  SponsorModel? model;
  PutPaymentStudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<GetPaymentStudentOtd?> putPaymentStudentController(
      String idStudent, PutPaymentStudentOtd putPaymentStudentOtd) async {
    final response = await http.put(
      Uri.parse('${url}payments/$idStudent'),
      body: putPaymentStudentOtdToJson(putPaymentStudentOtd),
      headers: {
        "Content-Type": "application/json",
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
