import 'package:http/http.dart' as http;

import '../model/getProvince.model.dart';

class GetProvinceController {
  Future<GetProvinceOtd?> getProvince() async {
    final response = await http.get(
      Uri.parse('https://vn-public-apis.fpo.vn/provinces/getAll?limit=-1'),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return getProvinceOtdFromJson(response.body);
    } else {
      return null;
    }
  }
}
