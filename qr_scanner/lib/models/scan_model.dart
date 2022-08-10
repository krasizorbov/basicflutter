import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    value.contains('http') ? type = 'http' : type = 'geo';
  }

  int? id;
  String? type;
  String value;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
