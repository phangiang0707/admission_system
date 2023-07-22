import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/getDetailStudent.model.dart';
import '../utils/url.dart';

class PostConfirmController {
  Future<GetDetailStudentOtd?> postConfirmController(String id) async {
    final response = await http.post(
      Uri.parse('${url}students/confirm'),
      body: jsonEncode({"studentId": id, "checked": true}),
      headers: {
        "Content-Type": "application/json",
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
