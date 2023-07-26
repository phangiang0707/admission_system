// To parse this JSON data, do
//
//     final getReportAllPaymenttd = getReportAllPaymenttdFromJson(jsonString);

import 'dart:convert';

GetReportAllPaymenttd getReportAllPaymenttdFromJson(String str) =>
    GetReportAllPaymenttd.fromJson(json.decode(str));

String getReportAllPaymenttdToJson(GetReportAllPaymenttd data) =>
    json.encode(data.toJson());

class GetReportAllPaymenttd {
  int total;
  int debt;

  GetReportAllPaymenttd({
    required this.total,
    required this.debt,
  });

  factory GetReportAllPaymenttd.fromJson(Map<String, dynamic> json) =>
      GetReportAllPaymenttd(
        total: json["total"],
        debt: json["debt"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "debt": debt,
      };
}

// To parse this JSON data, do
//
//     final getReportPaymenttd = getReportPaymenttdFromJson(jsonString);

List<GetReportPaymenttd> getReportPaymenttdFromJson(String str) =>
    List<GetReportPaymenttd>.from(
        json.decode(str).map((x) => GetReportPaymenttd.fromJson(x)));

String getReportPaymenttdToJson(List<GetReportPaymenttd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetReportPaymenttd {
  int total;
  int debt;
  String title;

  GetReportPaymenttd({
    required this.total,
    required this.debt,
    required this.title,
  });

  factory GetReportPaymenttd.fromJson(Map<String, dynamic> json) =>
      GetReportPaymenttd(
        total: json["total"],
        debt: json["debt"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "debt": debt,
        "title": title,
      };
}
