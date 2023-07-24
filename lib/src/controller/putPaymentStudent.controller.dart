import 'package:http/http.dart' as http;
import '../model/getPaymentStudent.model.dart';
import '../model/putPaymentStudent.model.dart';
import '../utils/url.dart';

class PutPaymentStudentController {
  Future<GetPaymentStudentOtd?> putPaymentStudentController(
      String idStudent, PutPaymentStudentOtd putPaymentStudentOtd) async {
    final response = await http.put(
      Uri.parse('${url}payments/$idStudent'),
      body: putPaymentStudentOtdToJson(putPaymentStudentOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getPaymentStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
