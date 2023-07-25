import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getListStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class StudentController {
  final BuildContext context;
  SponsorModel? model;
  StudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }

  Future<List<GetStudentOtd>?> getStudent() async {
    final response = await http.get(
      Uri.parse('${url}students'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
