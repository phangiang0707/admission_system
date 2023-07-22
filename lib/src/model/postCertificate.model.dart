// To parse this JSON data, do
//
//     final postCertificateOtd = postCertificateOtdFromJson(jsonString);

import 'dart:convert';

PostCertificateOtd postCertificateOtdFromJson(String str) =>
    PostCertificateOtd.fromJson(json.decode(str));

String postCertificateOtdToJson(PostCertificateOtd data) =>
    json.encode(data.toJson());

class PostCertificateOtd {
  String studentId;
  List<ChungChi> chungChi;

  PostCertificateOtd({
    required this.studentId,
    required this.chungChi,
  });

  factory PostCertificateOtd.fromJson(Map<String, dynamic> json) =>
      PostCertificateOtd(
        studentId: json["studentId"],
        chungChi: List<ChungChi>.from(
            json["chung_chi"].map((x) => ChungChi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "chung_chi": List<dynamic>.from(chungChi.map((x) => x.toJson())),
      };
}

class ChungChi {
  String id;
  bool checked;

  ChungChi({
    required this.id,
    required this.checked,
  });

  factory ChungChi.fromJson(Map<String, dynamic> json) => ChungChi(
        id: json["id"],
        checked: json["checked"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "checked": checked,
      };
}
