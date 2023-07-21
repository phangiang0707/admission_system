import '../model/getListPayments.model.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class PaymentsController {
  Future<List<GetPaymentsOtd>> getPayments(String trinhDo) async {
    final response =
        await http.get(Uri.parse('${url}payments/items?type=${trinhDo}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getPaymentsOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
