// To parse this JSON data, do
//
//     final getPaymentStudentOtd = getPaymentStudentOtdFromJson(jsonString);

import 'dart:convert';

List<GetListPaymentStudentOtd> getPaymentStudentOtdFromJson(String str) =>
    List<GetListPaymentStudentOtd>.from(
        json.decode(str).map((x) => GetListPaymentStudentOtd.fromJson(x)));

String getPaymentStudentOtdToJson(List<GetListPaymentStudentOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListPaymentStudentOtd {
  int total;
  int debt;
  String note;
  DateTime createdAt;
  DateTime updatedAt;
  Student student;
  String id;

  GetListPaymentStudentOtd({
    required this.total,
    required this.debt,
    required this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
    required this.id,
  });

  factory GetListPaymentStudentOtd.fromJson(Map<String, dynamic> json) =>
      GetListPaymentStudentOtd(
        total: json["total"],
        debt: json["debt"],
        note: json["note"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        student: Student.fromJson(json["student"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "debt": debt,
        "note": note,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "student": student.toJson(),
        "id": id,
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
