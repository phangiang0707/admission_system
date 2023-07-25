import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getDetailStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class DetailStudentController {
  final BuildContext context;
  SponsorModel? model;
  DetailStudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<GetDetailStudentOtd?> getStudent(String id) async {
    final response = await http.get(
      Uri.parse('${url}students/${id}'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getDetailStudentOtdFromJson(response.body);
    } else {
      print("error");
      return null;
    }
  }
}

// class DetailStudentController {
//   Future<GetDetailStudentOtd?> getStudent(String id) async {
//     final response = await http.get(
//       Uri.parse('${url}students/${id}'),
//     );
//     print(response.statusCode);
//     print(response.body);
//     if (response.statusCode == 200) {
//       return getDetailStudentOtdFromJson(response.body);
//     } else {
//       print("error");
//       return null;
//     }
//   }
// }
