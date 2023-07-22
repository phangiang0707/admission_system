import 'package:http/http.dart' as http;

import '../model/postCertificate.model.dart';
import '../utils/url.dart';

class PostCertificateController {
  Future<PostCertificateOtd?> postCertificateController(
      PostCertificateOtd postCertificateOtd) async {
    final response = await http.post(
      Uri.parse('${url}students/certificate'),
      body: postCertificateOtdToJson(postCertificateOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return postCertificateOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
