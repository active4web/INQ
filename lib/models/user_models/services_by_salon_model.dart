// To parse this JSON data, do
//
//     final servicesBySalonModel = servicesBySalonModelFromJson(jsonString);

import 'dart:convert';

ServicesBySalonModel servicesBySalonModelFromJson(String str) =>
    ServicesBySalonModel.fromJson(json.decode(str));

String servicesBySalonModelToJson(ServicesBySalonModel data) =>
    json.encode(data.toJson());

class ServicesBySalonModel {
  ServicesBySalonModel({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory ServicesBySalonModel.fromJson(Map<String, dynamic> json) =>
      ServicesBySalonModel(
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
    this.stpSsrUpdatedOn,
    this.stpSsrCreatedOn,
    this.stpSsrUpdatedBy,
    this.servicesNameLt,
    this.stpSpnBranchId,
    this.stpSsrServicesId,
    this.stpSsrNeedTimeHoure,
    this.stpSsrNeedTimeMinut,
    this.stpSsrCreatedBy,
    this.stpSalId,
    this.stpSsrId,
  });

  String servicesNameAr;
  int stpSsrUpdatedOn;
  int stpSsrCreatedOn;
  String stpSsrUpdatedBy;
  String servicesNameLt;
  int stpSpnBranchId;
  int stpSsrServicesId;
  int stpSsrNeedTimeHoure;
  int stpSsrNeedTimeMinut;
  String stpSsrCreatedBy;
  int stpSalId;
  int stpSsrId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        servicesNameAr: json["servicesNameAr"],
        stpSsrUpdatedOn: json["stpSsrUpdatedOn"],
        stpSsrCreatedOn: json["stpSsrCreatedOn"],
        stpSsrUpdatedBy: json["stpSsrUpdatedBy"],
        servicesNameLt: json["servicesNameLt"],
        stpSpnBranchId: json["stpSpnBranchId"],
        stpSsrServicesId: json["stpSsrServicesId"],
        stpSsrNeedTimeHoure: json["stpSsrNeedTimeHoure"],
        stpSsrNeedTimeMinut: json["stpSsrNeedTimeMinut"],
        stpSsrCreatedBy: json["stpSsrCreatedBy"],
        stpSalId: json["stpSalId"],
        stpSsrId: json["stpSsrId"],
      );

  Map<String, dynamic> toJson() => {
        "servicesNameAr": servicesNameAr,
        "stpSsrUpdatedOn": stpSsrUpdatedOn,
        "stpSsrCreatedOn": stpSsrCreatedOn,
        "stpSsrUpdatedBy": stpSsrUpdatedBy,
        "servicesNameLt": servicesNameLt,
        "stpSpnBranchId": stpSpnBranchId,
        "stpSsrServicesId": stpSsrServicesId,
        "stpSsrNeedTimeHoure": stpSsrNeedTimeHoure,
        "stpSsrNeedTimeMinut": stpSsrNeedTimeMinut,
        "stpSsrCreatedBy": stpSsrCreatedBy,
        "stpSalId": stpSalId,
        "stpSsrId": stpSsrId,
      };
}
