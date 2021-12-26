// To parse this JSON data, do
//
//     final signUpFailModel = signUpFailModelFromJson(jsonString);

import 'dart:convert';

ResponseFailModel signUpFailModelFromJson(String str) =>
    ResponseFailModel.fromJson(json.decode(str));

String signUpFailModelToJson(ResponseFailModel data) =>
    json.encode(data.toJson());

class ResponseFailModel {
  ResponseFailModel({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory ResponseFailModel.fromJson(Map<String, dynamic> json) =>
      ResponseFailModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.errorCode,
    this.errorDesc,
    this.errorLookup,
    this.severity,
    this.suppressed,
  });

  int errorCode;
  String errorDesc;
  ErrorLookup errorLookup;
  String severity;
  List<dynamic> suppressed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        errorCode: json["errorCode"],
        errorDesc: json["errorDesc"],
        errorLookup: ErrorLookup.fromJson(json["errorLookup"]),
        severity: json["severity"],
        suppressed: List<dynamic>.from(json["suppressed"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode,
        "errorDesc": errorDesc,
        "errorLookup": errorLookup.toJson(),
        "severity": severity,
        "suppressed": List<dynamic>.from(suppressed.map((x) => x)),
      };
}

class ErrorLookup {
  ErrorLookup({
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

  factory ErrorLookup.fromJson(Map<String, dynamic> json) => ErrorLookup(
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
