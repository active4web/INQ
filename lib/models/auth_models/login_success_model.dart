// To parse this JSON data, do
//
//     final loginSuccessModel = loginSuccessModelFromJson(jsonString);

import 'dart:convert';

LoginSuccessModel loginSuccessModelFromJson(String str) =>
    LoginSuccessModel.fromJson(json.decode(str));

String loginSuccessModelToJson(LoginSuccessModel data) =>
    json.encode(data.toJson());

class LoginSuccessModel {
  LoginSuccessModel({
    this.status,
    this.data,
  });

  bool status;
  Data data;

  factory LoginSuccessModel.fromJson(Map<String, dynamic> json) =>
      LoginSuccessModel(
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
    this.userLoginToken,
    this.usrName,
    this.usrType,
    this.usrActive,
    this.usrEmail,
    this.usrPhone,
    this.usrEnFullName,
    this.usrDeptNo,
    this.groups,
  });

  String userLoginToken;
  String usrName;
  String usrType;
  int usrActive;
  String usrEmail;
  String usrPhone;
  String usrEnFullName;
  int usrDeptNo;
  List<dynamic> groups;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userLoginToken: json["userLoginToken"],
        usrName: json["usrName"],
        usrType: json["usrType"],
        usrActive: json["usrActive"],
        usrEmail: json["usrEmail"],
        usrPhone: json["usrPhone"],
        usrEnFullName: json["usrEnFullName"],
        usrDeptNo: json["usrDeptNo"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userLoginToken": userLoginToken,
        "usrName": usrName,
        "usrType": usrType,
        "usrActive": usrActive,
        "usrEmail": usrEmail,
        "usrPhone": usrPhone,
        "usrEnFullName": usrEnFullName,
        "usrDeptNo": usrDeptNo,
        "groups": List<dynamic>.from(groups.map((x) => x)),
      };
}
