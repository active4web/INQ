// To parse this JSON data, do
//
//     final serviceModel = serviceModelFromJson(jsonString);

import 'dart:convert';

ServiceModel serviceModelFromJson(String str) => ServiceModel.fromJson(json.decode(str));

String serviceModelToJson(ServiceModel data) => json.encode(data.toJson());

class ServiceModel {
  ServiceModel({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
