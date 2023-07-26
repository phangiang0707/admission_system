import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/getReportPayment.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class GetReportPaymentController {
  final BuildContext context;
  SponsorModel? model;
  GetReportPaymentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<List<GetReportPaymenttd>?> getReportPayment(String type) async {
    final response = await http.get(
      Uri.parse('${url}reports/payments?type=$type'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getReportPaymenttdFromJson(response.body);
    } else {
      print("error");
      return null;
    }
  }
}

class GetReportAllPaymentController {
  final BuildContext context;
  SponsorModel? model;
  GetReportAllPaymentController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<GetReportAllPaymenttd?> getReportAllPayment() async {
    final response = await http.get(
      Uri.parse('${url}reports/payments'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getReportAllPaymenttdFromJson(response.body);
    } else {
      print("error");
      return null;
    }
  }
}
