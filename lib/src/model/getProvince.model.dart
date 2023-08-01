// To parse this JSON data, do
//
//     final getProvinceOtd = getProvinceOtdFromJson(jsonString);

import 'dart:convert';

GetProvinceOtd getProvinceOtdFromJson(String str) =>
    GetProvinceOtd.fromJson(json.decode(str));

String getProvinceOtdToJson(GetProvinceOtd data) => json.encode(data.toJson());

class GetProvinceOtd {
  int exitcode;
  Data data;
  String message;

  GetProvinceOtd({
    required this.exitcode,
    required this.data,
    required this.message,
  });

  factory GetProvinceOtd.fromJson(Map<String, dynamic> json) => GetProvinceOtd(
        exitcode: json["exitcode"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "exitcode": exitcode,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  int nItems;
  int nPages;
  List<Datum> data;

  Data({
    required this.nItems,
    required this.nPages,
    required this.data,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nItems: json["nItems"],
        nPages: json["nPages"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nItems": nItems,
        "nPages": nPages,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String id;
  String name;
  String slug;
  Type type;
  String nameWithType;
  String code;
  bool isDeleted;

  Datum({
    required this.id,
    required this.name,
    required this.slug,
    required this.type,
    required this.nameWithType,
    required this.code,
    required this.isDeleted,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        type: typeValues.map[json["type"]]!,
        nameWithType: json["name_with_type"],
        code: json["code"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "type": typeValues.reverse[type],
        "name_with_type": nameWithType,
        "code": code,
        "isDeleted": isDeleted,
      };
}

enum Type { THANH_PHO, TINH }

final typeValues = EnumValues({"thanh-pho": Type.THANH_PHO, "tinh": Type.TINH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
