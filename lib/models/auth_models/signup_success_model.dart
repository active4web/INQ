// To parse this JSON data, do
//
//     final signUpSuccessModel = signUpSuccessModelFromJson(jsonString);

import 'dart:convert';

SignUpSuccessModel signUpSuccessModelFromJson(String str) =>
    SignUpSuccessModel.fromJson(json.decode(str));

String signUpSuccessModelToJson(SignUpSuccessModel data) =>
    json.encode(data.toJson());

class SignUpSuccessModel {
  SignUpSuccessModel({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory SignUpSuccessModel.fromJson(Map<String, dynamic> json) =>
      SignUpSuccessModel(
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
    this.usrName,
    this.usrPswd,
    this.usrType,
    this.usrActive,
    this.usrEmail,
    this.usrMobile,
    this.usrEnFullName,
    this.usrGender,
    this.usrCountry,
    this.usrCity,
    this.usrPlace,
  });

  String usrName;
  String usrPswd;
  String usrType;
  int usrActive;
  String usrEmail;
  String usrMobile;
  String usrEnFullName;
  Usr usrGender;
  Usr usrCountry;
  Usr usrCity;
  Usr usrPlace;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        usrName: json["usrName"],
        usrPswd: json["usrPswd"],
        usrType: json["usrType"],
        usrActive: json["usrActive"],
        usrEmail: json["usrEmail"],
        usrMobile: json["usrMobile"],
        usrEnFullName: json["usrEnFullName"],
        usrGender: Usr.fromJson(json["usrGender"]),
        usrCountry: Usr.fromJson(json["usrCountry"]),
        usrCity: Usr.fromJson(json["usrCity"]),
        usrPlace: Usr.fromJson(json["usrPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "usrName": usrName,
        "usrPswd": usrPswd,
        "usrType": usrType,
        "usrActive": usrActive,
        "usrEmail": usrEmail,
        "usrMobile": usrMobile,
        "usrEnFullName": usrEnFullName,
        "usrGender": usrGender.toJson(),
        "usrCountry": usrCountry.toJson(),
        "usrCity": usrCity.toJson(),
        "usrPlace": usrPlace.toJson(),
      };
}

class Usr {
  Usr({
    this.scType,
    this.scCode,
  });

  int scType;
  int scCode;

  factory Usr.fromJson(Map<String, dynamic> json) => Usr(
        scType: json["scType"],
        scCode: json["scCode"],
      );

  Map<String, dynamic> toJson() => {
        "scType": scType,
        "scCode": scCode,
      };
}
