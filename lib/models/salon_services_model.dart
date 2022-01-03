// To parse this JSON data, do
//
//     final salonServicesModel = salonServicesModelFromJson(jsonString);

import 'dart:convert';

SalonServicesModel salonServicesModelFromJson(String str) =>
    SalonServicesModel.fromJson(json.decode(str));

String salonServicesModelToJson(SalonServicesModel data) =>
    json.encode(data.toJson());

class SalonServicesModel {
  SalonServicesModel({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory SalonServicesModel.fromJson(Map<String, dynamic> json) =>
      SalonServicesModel(
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
    this.servicesNameAr,
    this.stpSsrId,
    this.stpSalId,
    this.stpSsrNeedTimeHoure,
    this.stpSpnBranchId,
    this.stpSsrNeedTimeMinut,
    this.stpSsrCreatedBy,
    this.stpSsrServicesId,
    this.servicesNameLt,
    this.stpSsrUpdatedOn,
    this.stpSsrUpdatedBy,
    this.stpSsrCreatedOn,
  });

  String servicesNameAr;
  int stpSsrId;
  int stpSalId;
  int stpSsrNeedTimeHoure;
  int stpSpnBranchId;
  int stpSsrNeedTimeMinut;
  String stpSsrCreatedBy;
  int stpSsrServicesId;
  String servicesNameLt;
  int stpSsrUpdatedOn;
  String stpSsrUpdatedBy;
  int stpSsrCreatedOn;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        servicesNameAr: json["servicesNameAr"],
        stpSsrId: json["stpSsrId"],
        stpSalId: json["stpSalId"],
        stpSsrNeedTimeHoure: json["stpSsrNeedTimeHoure"],
        stpSpnBranchId: json["stpSpnBranchId"],
        stpSsrNeedTimeMinut: json["stpSsrNeedTimeMinut"],
        stpSsrCreatedBy: json["stpSsrCreatedBy"],
        stpSsrServicesId: json["stpSsrServicesId"],
        servicesNameLt: json["servicesNameLt"],
        stpSsrUpdatedOn: json["stpSsrUpdatedOn"],
        stpSsrUpdatedBy: json["stpSsrUpdatedBy"],
        stpSsrCreatedOn: json["stpSsrCreatedOn"],
      );

  Map<String, dynamic> toJson() => {
        "servicesNameAr": servicesNameAr,
        "stpSsrId": stpSsrId,
        "stpSalId": stpSalId,
        "stpSsrNeedTimeHoure": stpSsrNeedTimeHoure,
        "stpSpnBranchId": stpSpnBranchId,
        "stpSsrNeedTimeMinut": stpSsrNeedTimeMinut,
        "stpSsrCreatedBy": stpSsrCreatedBy,
        "stpSsrServicesId": stpSsrServicesId,
        "servicesNameLt": servicesNameLt,
        "stpSsrUpdatedOn": stpSsrUpdatedOn,
        "stpSsrUpdatedBy": stpSsrUpdatedBy,
        "stpSsrCreatedOn": stpSsrCreatedOn,
      };
}
