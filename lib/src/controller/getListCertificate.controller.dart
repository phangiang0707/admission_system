import '../model/getCertificate.model.dart';
import '../utils/url.dart';
import 'package:http/http.dart' as http;

class CertificateController {
  Future<List<GetCertificateOtd>> getCertificate() async {
    final response = await http.get(Uri.parse('${url}certificates'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getCertificateOtdFromJson(response.body);
    } else {
      return [];
    }
  }
}
