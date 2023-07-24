import '../model/getListPaymentsStudent.model.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class GetListPaymentStudentController {
  Future<List<GetListPaymentStudentOtd>?> getListPaymentStudent() async {
    final response = await http.get(Uri.parse('${url}payments'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getPaymentStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
