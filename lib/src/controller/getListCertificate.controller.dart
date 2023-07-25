import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getCertificate.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class CertificateController {
  final BuildContext context;
  SponsorModel? model;
  CertificateController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<List<GetCertificateOtd>> getCertificate() async {
    final response = await http.get(
      Uri.parse('${url}certificates'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getCertificateOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
