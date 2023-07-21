import '../model/getDetailStudent.model.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class DetailStudentController {
  Future<GetDetailStudentOtd?> getStudent(String id) async {
    final response = await http.get(Uri.parse('${url}students/${id}'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getDetailStudentOtdFromJson(response.body);
    } else {
      print("error");
      return null;
    }
  }
}
