// To parse this JSON data, do
//
//     final getPaymentsOtd = getPaymentsOtdFromJson(jsonString);

import 'dart:convert';

List<GetPaymentsOtd> getPaymentsOtdFromJson(String str) =>
    List<GetPaymentsOtd>.from(
        json.decode(str).map((x) => GetPaymentsOtd.fromJson(x)));

String getPaymentsOtdToJson(List<GetPaymentsOtd> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPaymentsOtd {
  String name;
  int price;
  String quantity;
  bool delivered;
  String type;
  String note;
  String id;

  GetPaymentsOtd({
    required this.name,
    required this.price,
    required this.quantity,
    required this.delivered,
    required this.type,
    required this.note,
    required this.id,
  });

  factory GetPaymentsOtd.fromJson(Map<String, dynamic> json) => GetPaymentsOtd(
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        delivered: json["delivered"],
        type: json["type"],
        note: json["note"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "quantity": quantity,
        "delivered": delivered,
        "type": type,
        "note": note,
        "id": id,
      };
}
