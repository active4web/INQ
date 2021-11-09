// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

List<ServiceModel> serviceModelFromJson(String str) => List<ServiceModel>.from(json.decode(str).map((x) => ServiceModel.fromJson(x)));

String serviceModelToJson(List<ServiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceModel {
  ServiceModel({
    this.scType,
    this.scCode,
    this.scParentType,
    this.scParentCode,
    this.scArDesc,
    this.scEnDesc,
    this.scFrDesc,
    this.scNumericCode,
  });

  int scType;
  int scCode;
  int scParentType;
  int scParentCode;
  String scArDesc;
  String scEnDesc;
  String scFrDesc;
  int scNumericCode;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    scType: json["scType"],
    scCode: json["scCode"],
    scParentType: json["scParentType"],
    scParentCode: json["scParentCode"],
    scArDesc: json["scArDesc"],
    scEnDesc: json["scEnDesc"],
    scFrDesc: json["scFrDesc"],
    scNumericCode: json["scNumericCode"],
  );

  Map<String, dynamic> toJson() => {
    "scType": scType,
    "scCode": scCode,
    "scParentType": scParentType,
    "scParentCode": scParentCode,
    "scArDesc": scArDesc,
    "scEnDesc": scEnDesc,
    "scFrDesc": scFrDesc,
    "scNumericCode": scNumericCode,
  };
}
