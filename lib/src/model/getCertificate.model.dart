// To parse this JSON data, do
//
//     final getCertificateOtd = getCertificateOtdFromJson(jsonString);

import 'dart:convert';

List<GetCertificateOtd> getCertificateOtdFromJson(String str) =>
    List<GetCertificateOtd>.from(
        json.decode(str).map((x) => GetCertificateOtd.fromJson(x)));

String getCertificateOtdToJson(List<GetCertificateOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCertificateOtd {
  String noiDung;
  String yeuCau;
  int soLuong;
  List<TrinhDo> trinhDo;
  DonVi donVi;
  DateTime createdAt;
  DateTime updatedAt;
  String id;

  GetCertificateOtd({
    required this.noiDung,
    required this.yeuCau,
    required this.soLuong,
    required this.trinhDo,
    required this.donVi,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

  factory GetCertificateOtd.fromJson(Map<String, dynamic> json) =>
      GetCertificateOtd(
        noiDung: json["noi_dung"],
        yeuCau: json["yeu_cau"],
        soLuong: json["so_luong"],
        trinhDo: List<TrinhDo>.from(
            json["trinh_do"].map((x) => trinhDoValues.map[x]!)),
        donVi: donViValues.map[json["don_vi"]]!,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "noi_dung": noiDung,
        "yeu_cau": yeuCau,
        "so_luong": soLuong,
        "trinh_do":
            List<dynamic>.from(trinhDo.map((x) => trinhDoValues.reverse[x])),
        "don_vi": donViValues.reverse[donVi],
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "id": id,
      };
}

enum DonVi { BN, TM }

final donViValues = EnumValues({"bản": DonVi.BN, "tấm": DonVi.TM});

enum TrinhDo { CAO_DANG, TRUNG_CAP }

final trinhDoValues =
    EnumValues({"CAO_DANG": TrinhDo.CAO_DANG, "TRUNG_CAP": TrinhDo.TRUNG_CAP});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
