// To parse this JSON data, do
//
//     final barberInfoModel = barberInfoModelFromJson(jsonString);

import 'dart:convert';

BarberInfoModel barberInfoModelFromJson(String str) =>
    BarberInfoModel.fromJson(json.decode(str));

String barberInfoModelToJson(BarberInfoModel data) =>
    json.encode(data.toJson());

class BarberInfoModel {
  BarberInfoModel({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory BarberInfoModel.fromJson(Map<String, dynamic> json) =>
      BarberInfoModel(
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
    this.barberRate,
    this.stpSbrId,
    this.stpSalId,
    this.stpSbrCv,
    this.stpSbrEmail,
    this.stpSbrNameAr,
    this.stpSbrNameLt,
    this.stpSbrGender,
    this.stpSbrBranchId,
    this.stpSbrYearsOfExperience,
    this.stpSbrUsername,
    this.stpSbrPersonalPhoto,
    this.stpSbrCreatedOn,
    this.stpSbrUpdatedOn,
    this.stpSbrCreatedBy,
    this.stpSbrUpdatedBy,
  });

  int barberRate;
  int stpSbrId;
  int stpSalId;
  String stpSbrCv;
  String stpSbrEmail;
  String stpSbrNameAr;
  String stpSbrNameLt;
  int stpSbrGender;
  int stpSbrBranchId;
  int stpSbrYearsOfExperience;
  String stpSbrUsername;
  String stpSbrPersonalPhoto;
  int stpSbrCreatedOn;
  int stpSbrUpdatedOn;
  String stpSbrCreatedBy;
  String stpSbrUpdatedBy;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        barberRate: json["barberRate"],
        stpSbrId: json["stpSbrId"],
        stpSalId: json["stpSalId"],
        stpSbrCv: json["stpSbrCv"],
        stpSbrEmail: json["stpSbrEmail"],
        stpSbrNameAr: json["stpSbrNameAr"],
        stpSbrNameLt: json["stpSbrNameLt"],
        stpSbrGender: json["stpSbrGender"],
        stpSbrBranchId: json["stpSbrBranchId"],
        stpSbrYearsOfExperience: json["stpSbrYearsOfExperience"],
        stpSbrUsername: json["stpSbrUsername"],
        stpSbrPersonalPhoto: json["stpSbrPersonalPhoto"],
        stpSbrCreatedOn: json["stpSbrCreatedOn"],
        stpSbrUpdatedOn: json["stpSbrUpdatedOn"],
        stpSbrCreatedBy: json["stpSbrCreatedBy"],
        stpSbrUpdatedBy: json["stpSbrUpdatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "barberRate": barberRate,
        "stpSbrId": stpSbrId,
        "stpSalId": stpSalId,
        "stpSbrCv": stpSbrCv,
        "stpSbrEmail": stpSbrEmail,
        "stpSbrNameAr": stpSbrNameAr,
        "stpSbrNameLt": stpSbrNameLt,
        "stpSbrGender": stpSbrGender,
        "stpSbrBranchId": stpSbrBranchId,
        "stpSbrYearsOfExperience": stpSbrYearsOfExperience,
        "stpSbrUsername": stpSbrUsername,
        "stpSbrPersonalPhoto": stpSbrPersonalPhoto,
        "stpSbrCreatedOn": stpSbrCreatedOn,
        "stpSbrUpdatedOn": stpSbrUpdatedOn,
        "stpSbrCreatedBy": stpSbrCreatedBy,
        "stpSbrUpdatedBy": stpSbrUpdatedBy,
      };
}
