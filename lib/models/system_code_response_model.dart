// To parse this JSON data, do
//
//     final responseBodyModel = responseBodyModelFromJson(jsonString);

import 'dart:convert';

SystemCodeResponseModel responseBodyModelFromJson(String str) =>
    SystemCodeResponseModel.fromJson(json.decode(str));

String responseBodyModelToJson(SystemCodeResponseModel data) =>
    json.encode(data.toJson());

class SystemCodeResponseModel {
  SystemCodeResponseModel({
    this.scType,
    this.scCode,
    this.scParentType,
    this.scParentCode,
    this.scArDesc,
    this.scEnDesc,
    this.scNumericCode,
  });

  int scType;
  int scCode;
  int scParentType;
  int scParentCode;
  String scArDesc;
  String scEnDesc;
  int scNumericCode;

  factory SystemCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      SystemCodeResponseModel(
        scType: json["scType"],
        scCode: json["scCode"],
        scParentType: json["scParentType"],
        scParentCode: json["scParentCode"],
        scArDesc: json["scArDesc"],
        scEnDesc: json["scEnDesc"],
        scNumericCode: json["scNumericCode"],
      );

  Map<String, dynamic> toJson() => {
        "scType": scType,
        "scCode": scCode,
        "scParentType": scParentType,
        "scParentCode": scParentCode,
        "scArDesc": scArDesc,
        "scEnDesc": scEnDesc,
        "scNumericCode": scNumericCode,
      };
}
