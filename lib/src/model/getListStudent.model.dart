// To parse this JSON data, do
//
//     final getStudentOtd = getStudentOtdFromJson(jsonString);

import 'dart:convert';

List<GetStudentOtd> getStudentOtdFromJson(String str) =>
    List<GetStudentOtd>.from(
        json.decode(str).map((x) => GetStudentOtd.fromJson(x)));

String getStudentOtdToJson(List<GetStudentOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStudentOtd {
  String maHocSinh;
  String hoVaTenDem;
  String ten;
  String sdtHocSinh;
  String cccd;
  String hoTen;
  String id;

  GetStudentOtd({
    required this.maHocSinh,
    required this.hoVaTenDem,
    required this.ten,
    required this.sdtHocSinh,
    required this.cccd,
    required this.hoTen,
    required this.id,
  });

  factory GetStudentOtd.fromJson(Map<String, dynamic> json) => GetStudentOtd(
        maHocSinh: json["ma_hoc_sinh"],
        hoVaTenDem: json["ho_va_ten_dem"],
        ten: json["ten"],
        sdtHocSinh: json["sdt_hoc_sinh"],
        cccd: json["cccd"],
        hoTen: json["ho_ten"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "ma_hoc_sinh": maHocSinh,
        "ho_va_ten_dem": hoVaTenDem,
        "ten": ten,
        "sdt_hoc_sinh": sdtHocSinh,
        "cccd": cccd,
        "ho_ten": hoTen,
        "id": id,
      };
}
