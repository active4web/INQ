// To parse this JSON data, do
//
//     final barberServicesModel = barberServicesModelFromJson(jsonString);

import 'dart:convert';

BarberServicesModel barberServicesModelFromJson(String str) =>
    BarberServicesModel.fromJson(json.decode(str));

String barberServicesModelToJson(BarberServicesModel data) =>
    json.encode(data.toJson());

class BarberServicesModel {
  BarberServicesModel({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory BarberServicesModel.fromJson(Map<String, dynamic> json) =>
      BarberServicesModel(
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
    this.stpSbsId,
    this.stpSbsBranchId,
    this.stpSbsCurrencyId,
    this.stpSbsNeededHoure,
    this.stpSbsNeededMinutes,
    this.stpSbsPrice,
    this.stpSrvName,
    this.stpSbrName,
  });

  int stpSbsId;
  int stpSbsBranchId;
  int stpSbsCurrencyId;
  int stpSbsNeededHoure;
  int stpSbsNeededMinutes;
  dynamic stpSbsPrice;
  String stpSrvName;
  String stpSbrName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stpSbsId: json["stpSbsId"],
        stpSbsBranchId: json["stpSbsBranchId"],
        stpSbsCurrencyId: json["stpSbsCurrencyId"],
        stpSbsNeededHoure: json["stpSbsNeededHoure"],
        stpSbsNeededMinutes: json["stpSbsNeededMinutes"],
        stpSbsPrice: json["stpSbsPrice"],
        stpSrvName: json["stpSrvName"],
        stpSbrName: json["stpSbrName"],
      );

  Map<String, dynamic> toJson() => {
        "stpSbsId": stpSbsId,
        "stpSbsBranchId": stpSbsBranchId,
        "stpSbsCurrencyId": stpSbsCurrencyId,
        "stpSbsNeededHoure": stpSbsNeededHoure,
        "stpSbsNeededMinutes": stpSbsNeededMinutes,
        "stpSbsPrice": stpSbsPrice,
        "stpSrvName": stpSrvName,
        "stpSbrName": stpSbrName,
      };
}
