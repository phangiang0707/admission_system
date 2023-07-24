import 'package:http/http.dart' as http;
import '../model/getDetailStudent.model.dart';
import '../model/postStudent.model.dart';
import '../utils/url.dart';

class PostStudentController {
  Future<GetDetailStudentOtd?> postStudentController(
      PostStudentOtd postStudentOtd) async {
    final response = await http.post(
      Uri.parse('${url}students'),
      body: postStudentOtdToJson(postStudentOtd),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 201) {
      return getDetailStudentOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
