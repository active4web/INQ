// To parse this JSON data, do
//
//     final barbersBySalonModel = barbersBySalonModelFromJson(jsonString);

import 'dart:convert';

BarbersBySalonModel barbersBySalonModelFromJson(String str) =>
    BarbersBySalonModel.fromJson(json.decode(str));

String barbersBySalonModelToJson(BarbersBySalonModel data) =>
    json.encode(data.toJson());

class BarbersBySalonModel {
  BarbersBySalonModel({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory BarbersBySalonModel.fromJson(Map<String, dynamic> json) =>
      BarbersBySalonModel(
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
    this.salonNameAr,
    this.salonNameLt,
    this.bearberNameAr,
    this.bearberNameLt,
    this.stpMapUpdatedBy,
    this.stpMapCreatedOn,
    this.stpMapUpdatedOn,
    this.stpMapCreatedBy,
    this.stpSalId,
    this.stpSbrId,
    this.stpMapId,
  });

  String salonNameAr;
  String salonNameLt;
  String bearberNameAr;
  String bearberNameLt;
  String stpMapUpdatedBy;
  int stpMapCreatedOn;
  int stpMapUpdatedOn;
  String stpMapCreatedBy;
  int stpSalId;
  int stpSbrId;
  int stpMapId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        salonNameAr: json["salonNameAr"],
        salonNameLt: json["salonNameLt"],
        bearberNameAr: json["bearberNameAr"],
        bearberNameLt: json["bearberNameLt"],
        stpMapUpdatedBy: json["stpMapUpdatedBy"],
        stpMapCreatedOn: json["stpMapCreatedOn"],
        stpMapUpdatedOn: json["stpMapUpdatedOn"],
        stpMapCreatedBy: json["stpMapCreatedBy"],
        stpSalId: json["stpSalId"],
        stpSbrId: json["stpSbrId"],
        stpMapId: json["stpMapId"],
      );

  Map<String, dynamic> toJson() => {
        "salonNameAr": salonNameAr,
        "salonNameLt": salonNameLt,
        "bearberNameAr": bearberNameAr,
        "bearberNameLt": bearberNameLt,
        "stpMapUpdatedBy": stpMapUpdatedBy,
        "stpMapCreatedOn": stpMapCreatedOn,
        "stpMapUpdatedOn": stpMapUpdatedOn,
        "stpMapCreatedBy": stpMapCreatedBy,
        "stpSalId": stpSalId,
        "stpSbrId": stpSbrId,
        "stpMapId": stpMapId,
      };
}
