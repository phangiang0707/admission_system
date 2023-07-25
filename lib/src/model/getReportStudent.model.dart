// To parse this JSON data, do
//
//     final getReportStudentOtd = getReportStudentOtdFromJson(jsonString);

import 'dart:convert';

List<GetReportStudentOtd> getReportStudentOtdFromJson(String str) =>
    List<GetReportStudentOtd>.from(
        json.decode(str).map((x) => GetReportStudentOtd.fromJson(x)));

String getReportStudentOtdToJson(List<GetReportStudentOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetReportStudentOtd {
  int total;
  String title;

  GetReportStudentOtd({
    required this.total,
    required this.title,
  });

  factory GetReportStudentOtd.fromJson(Map<String, dynamic> json) =>
      GetReportStudentOtd(
        total: json["total"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "title": title,
      };
}

// To parse this JSON data, do
//
//     final getReportStudentOtd = getReportStudentOtdFromJson(jsonString);
// To parse this JSON data, do
//
//     final getReportAllStudentOtd = getReportAllStudentOtdFromJson(jsonString);

GetReportAllStudentOtd getReportAllStudentOtdFromJson(String str) =>
    GetReportAllStudentOtd.fromJson(json.decode(str));

String getReportAllStudentOtdToJson(GetReportAllStudentOtd data) =>
    json.encode(data.toJson());

class GetReportAllStudentOtd {
  int daNhapHoc;
  int chuaNhapHoc;
  int tongSo;

  GetReportAllStudentOtd({
    required this.daNhapHoc,
    required this.chuaNhapHoc,
    required this.tongSo,
  });

  factory GetReportAllStudentOtd.fromJson(Map<String, dynamic> json) =>
      GetReportAllStudentOtd(
        daNhapHoc: json["da_nhap_hoc"],
        chuaNhapHoc: json["chua_nhap_hoc"],
        tongSo: json["tong_so"],
      );

  Map<String, dynamic> toJson() => {
        "da_nhap_hoc": daNhapHoc,
        "chua_nhap_hoc": chuaNhapHoc,
        "tong_so": tongSo,
      };
}
