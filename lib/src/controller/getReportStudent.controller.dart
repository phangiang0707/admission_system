import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/getReportStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class GetReportStudentController {
  final BuildContext context;
  SponsorModel? model;
  GetReportStudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<List<GetReportStudentOtd>?> getReportStudent(String type) async {
    final response = await http.get(
      Uri.parse('${url}reports/students?type=$type'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getReportStudentOtdFromJson(response.body);
    } else {
      print("error");
      return null;
    }
  }
}

class GetReportStudentController1 {
  final BuildContext context;
  SponsorModel? model;
  GetReportStudentController1({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<GetReportAllStudentOtd?> getReportStudent1() async {
    final response = await http.get(
      Uri.parse('${url}reports/students'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getReportAllStudentOtdFromJson(response.body);
    } else {
      print("error");
      return null;
    }
  }
}
