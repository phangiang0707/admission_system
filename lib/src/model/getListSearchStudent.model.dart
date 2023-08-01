// To parse this JSON data, do
//
//     final getListSearchStudentOtd = getListSearchStudentOtdFromJson(jsonString);

import 'dart:convert';

List<GetListSearchStudentOtd> getListSearchStudentOtdFromJson(String str) =>
    List<GetListSearchStudentOtd>.from(
        json.decode(str).map((x) => GetListSearchStudentOtd.fromJson(x)));

String getListSearchStudentOtdToJson(List<GetListSearchStudentOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListSearchStudentOtd {
  String maHocSinh;
  String hoVaTenDem;
  String ten;
  String sdtHocSinh;
  String giayCntnTruong;
  String cccd;
  DateTime createdAt;
  String id;
  bool hasPayment;

  GetListSearchStudentOtd({
    required this.maHocSinh,
    required this.hoVaTenDem,
    required this.ten,
    required this.sdtHocSinh,
    required this.giayCntnTruong,
    required this.cccd,
    required this.createdAt,
    required this.id,
    required this.hasPayment,
  });

  factory GetListSearchStudentOtd.fromJson(Map<String, dynamic> json) =>
      GetListSearchStudentOtd(
        maHocSinh: json["ma_hoc_sinh"],
        hoVaTenDem: json["ho_va_ten_dem"],
        ten: json["ten"],
        sdtHocSinh: json["sdt_hoc_sinh"],
        giayCntnTruong: json["giay_cntn_truong"],
        cccd: json["cccd"],
        createdAt: DateTime.parse(json["createdAt"]),
        id: json["id"],
        hasPayment: json["hasPayment"],
      );

  Map<String, dynamic> toJson() => {
        "ma_hoc_sinh": maHocSinh,
        "ho_va_ten_dem": hoVaTenDem,
        "ten": ten,
        "sdt_hoc_sinh": sdtHocSinh,
        "giay_cntn_truong": giayCntnTruong,
        "cccd": cccd,
        "createdAt": createdAt.toIso8601String(),
        "id": id,
        "hasPayment": hasPayment,
      };
}
