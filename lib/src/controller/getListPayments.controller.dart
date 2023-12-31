import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/getListPayments.model.dart';
import '../model/sponsorModel.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class PaymentsController {
  final BuildContext context;
  SponsorModel? model;
  PaymentsController({required this.context}) {
    model = Provider.of<SponsorModel>(context, listen: false);
  }
  Future<List<GetPaymentsOtd>> getPayments(String trinhDo) async {
    final response = await http.get(
      Uri.parse('${url}payments/items?type=${trinhDo}'),
      headers: {
        "Authorization": "Bearer ${model!.getLogin!.accessToken}",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getPaymentsOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
