import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../model/getDetailStudent.model.dart';
import '../model/postStudent.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';

class PutDetailStudentController {
  final BuildContext context;
  SponsorModel? model;
  PutDetailStudentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }

  Future<GetDetailStudentOtd?> putDetailStudentController(
      String idStudent, PostStudentOtd postStudentOtd) async {
    final response = await http.put(
      Uri.parse('${url}students/$idStudent'),
      body: postStudentOtdToJson(postStudentOtd),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getDetailStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
