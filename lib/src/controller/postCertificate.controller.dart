import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../model/postCertificate.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';

class PostCertificateController {
  final BuildContext context;
  SponsorModel? model;
  PostCertificateController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }

  Future<PostCertificateOtd?> postCertificateController(
      PostCertificateOtd postCertificateOtd) async {
    final response = await http.post(
      Uri.parse('${url}students/certificate'),
      body: postCertificateOtdToJson(postCertificateOtd),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
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
