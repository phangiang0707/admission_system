// To parse this JSON data, do
//
//     final putPaymentStudentOtd = putPaymentStudentOtdFromJson(jsonString);

import 'dart:convert';

PutPaymentStudentOtd putPaymentStudentOtdFromJson(String str) =>
    PutPaymentStudentOtd.fromJson(json.decode(str));

String putPaymentStudentOtdToJson(PutPaymentStudentOtd data) =>
    json.encode(data.toJson());

class PutPaymentStudentOtd {
  List<Item1> items;
  String type;
  String note;

  PutPaymentStudentOtd({
    required this.items,
    required this.type,
    required this.note,
  });

  factory PutPaymentStudentOtd.fromJson(Map<String, dynamic> json) =>
      PutPaymentStudentOtd(
        items: List<Item1>.from(json["items"].map((x) => Item1.fromJson(x))),
        type: json["type"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "type": type,
        "note": note,
      };
}

class Item1 {
  String id;
  bool checked;

  Item1({
    required this.id,
    required this.checked,
  });

  factory Item1.fromJson(Map<String, dynamic> json) => Item1(
        id: json["id"],
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "checked": checked,
      };
}
