import '../model/getListStudent.model.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class StudentController {
  Future<List<GetStudentOtd>?> getStudent() async {
    final response = await http.get(Uri.parse('${url}students'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
