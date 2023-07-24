import '../model/getPaymentStudent.model.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class GetPaymentStudentController {
  Future<GetPaymentStudentOtd?> getStudent(String id) async {
    final response =
        await http.get(Uri.parse('${url}payments/byStudent?studentId=${id}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getPaymentStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
