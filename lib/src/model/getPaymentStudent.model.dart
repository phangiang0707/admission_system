// To parse this JSON data, do
//
//     final getPaymentStudentOtd = getPaymentStudentOtdFromJson(jsonString);

import 'dart:convert';

GetPaymentStudentOtd getPaymentStudentOtdFromJson(String str) =>
    GetPaymentStudentOtd.fromJson(json.decode(str));

String getPaymentStudentOtdToJson(GetPaymentStudentOtd data) =>
    json.encode(data.toJson());

class GetPaymentStudentOtd {
  Student student;
  List<Item> items;
  int total;
  int debt;
  String note;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  GetPaymentStudentOtd({
    required this.student,
    required this.items,
    required this.total,
    required this.debt,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory GetPaymentStudentOtd.fromJson(Map<String, dynamic> json) =>
      GetPaymentStudentOtd(
        student: Student.fromJson(json["student"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        total: json["total"],
        debt: json["debt"],
        note: json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "student": student.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "total": total,
        "debt": debt,
        "note": note,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}

class Item {
  String id;
  bool checked;
  dynamic checkedAt;
  bool delivered;
  dynamic deliveredAt;

  Item({
    required this.id,
    required this.checked,
    this.checkedAt,
    required this.delivered,
    this.deliveredAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        checked: json["checked"],
        checkedAt: json["checkedAt"],
        delivered: json["delivered"],
        deliveredAt: json["deliveredAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "checked": checked,
        "checkedAt": checkedAt,
        "delivered": delivered,
        "deliveredAt": deliveredAt,
      };
}

class Student {
  String hoVaTenDem;
  String ten;
  String sdtHocSinh;
  String cccd;
  String hoTen;
  String id;

  Student({
    required this.hoVaTenDem,
    required this.ten,
    required this.sdtHocSinh,
    required this.cccd,
    required this.hoTen,
    required this.id,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        hoVaTenDem: json["ho_va_ten_dem"],
        ten: json["ten"],
        sdtHocSinh: json["sdt_hoc_sinh"],
        cccd: json["cccd"],
        hoTen: json["ho_ten"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ho_va_ten_dem": hoVaTenDem,
        "ten": ten,
        "sdt_hoc_sinh": sdtHocSinh,
        "cccd": cccd,
        "ho_ten": hoTen,
        "id": id,
      };
}
