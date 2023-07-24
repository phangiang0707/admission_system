import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/getPaymentStudent.model.dart';
import '../utils/url.dart';

class PostPaymentController {
  Future<GetPaymentStudentOtd?> postPaymentController(String id) async {
    final response = await http.post(
      Uri.parse('${url}payments'),
      body: jsonEncode({"studentId": id}),
      headers: {
        "Content-Type": "application/json",
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
