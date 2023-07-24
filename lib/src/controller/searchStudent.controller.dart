import '../model/getListStudent.model.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class SearchStudentController {
  Future<List<GetStudentOtd>> searchStudent(String id) async {
    final response = await http.get(
      Uri.parse('${url}students/search?cccd=${id}'),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getStudentOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
