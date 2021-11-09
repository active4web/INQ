// To parse this JSON data, do
//
//     final responseBodyModel = responseBodyModelFromJson(jsonString);

import 'dart:convert';

ResponseBodyModel responseBodyModelFromJson(String str) => ResponseBodyModel.fromJson(json.decode(str));

String responseBodyModelToJson(ResponseBodyModel data) => json.encode(data.toJson());

class ResponseBodyModel {
  ResponseBodyModel({
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

  factory ResponseBodyModel.fromJson(Map<String, dynamic> json) => ResponseBodyModel(
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
