import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getListSearchStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class SearchStudentController {
  final BuildContext context;
  SponsorModel? model;
  SearchStudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<List<GetListSearchStudentOtd>> searchStudent(String id) async {
    final response = await http.get(
      Uri.parse('${url}students/search?data=${id}'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getListSearchStudentOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
