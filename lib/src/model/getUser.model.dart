// To parse this JSON data, do
//
//     final getUserOtd = getUserOtdFromJson(jsonString);

import 'dart:convert';

LoginOTD loginFromJson(String str) => LoginOTD.fromJson(json.decode(str));

String loginToJson(LoginOTD data) => json.encode(data.toJson());

class LoginOTD {
  String accessToken;
  String refreshToken;
  LoginOTD({required this.accessToken, required this.refreshToken});
  factory LoginOTD.fromJson(Map<String, dynamic> json) => LoginOTD(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

Data getUserOtdFromJson(String str) => Data.fromJson(json.decode(str));

String getUserOtdToJson(Data data) => json.encode(data.toJson());

class Data {
  String email;
  String fullname;
  String phone;
  List<String> roles;
  DateTime createdAt;
  String id;

  Data({
    required this.email,
    required this.fullname,
    required this.phone,
    required this.roles,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json["email"],
        fullname: json["fullname"],
        phone: json["phone"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "fullname": fullname,
        "phone": phone,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "id": id,
      };
}
