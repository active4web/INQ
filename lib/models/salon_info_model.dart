// To parse this JSON data, do
//
//     final salonInfoModel = salonInfoModelFromJson(jsonString);

import 'dart:convert';

SalonInfoModel salonInfoModelFromJson(String str) =>
    SalonInfoModel.fromJson(json.decode(str));

String salonInfoModelToJson(SalonInfoModel data) => json.encode(data.toJson());

class SalonInfoModel {
  SalonInfoModel({
    this.status,
    this.data,
  });

  bool status;
  List<Datum> data;

  factory SalonInfoModel.fromJson(Map<String, dynamic> json) => SalonInfoModel(
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
    this.salonRate,
    this.stpSalEmail,
    this.stpSalCityId,
    this.stpSalId,
    this.stpSalNameAr,
    this.stpSalType,
    this.stpSalPhoneNumber,
    this.stpSalVocationalLicense,
    this.stpSalSalonsStatus,
    this.stpSalUsername,
    this.stpSalBranchId,
    this.stpSalQrKeyCode,
    this.stpSalOwnerNameAr,
    this.stpSalLongitude,
    this.stpSalLatitude,
    this.stpSalCountryId,
    this.stpSalGpsLocation,
    this.stpSalSalonsStatusDate,
    this.stpSalShopPicture,
    this.stpSalSalonNoteAbout,
    this.stpSalCreatedBy,
    this.stpSalUpdatedBy,
    this.stpSalUpdatedOn,
    this.stpSalCreatedOn,
  });

  dynamic salonRate;
  String stpSalEmail;
  int stpSalCityId;
  int stpSalId;
  String stpSalNameAr;
  int stpSalType;
  String stpSalPhoneNumber;
  String stpSalVocationalLicense;
  int stpSalSalonsStatus;
  String stpSalUsername;
  int stpSalBranchId;
  String stpSalQrKeyCode;
  String stpSalOwnerNameAr;
  String stpSalLongitude;
  String stpSalLatitude;
  int stpSalCountryId;
  String stpSalGpsLocation;
  int stpSalSalonsStatusDate;
  String stpSalShopPicture;
  String stpSalSalonNoteAbout;
  String stpSalCreatedBy;
  String stpSalUpdatedBy;
  int stpSalUpdatedOn;
  int stpSalCreatedOn;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        salonRate: json["salonRate"],
        stpSalEmail: json["stpSalEmail"],
        stpSalCityId: json["stpSalCityId"],
        stpSalId: json["stpSalId"],
        stpSalNameAr: json["stpSalNameAr"],
        stpSalType: json["stpSalType"],
        stpSalPhoneNumber: json["stpSalPhoneNumber"],
        stpSalVocationalLicense: json["stpSalVocationalLicense"],
        stpSalSalonsStatus: json["stpSalSalonsStatus"],
        stpSalUsername: json["stpSalUsername"],
        stpSalBranchId: json["stpSalBranchId"],
        stpSalQrKeyCode: json["stpSalQrKeyCode"],
        stpSalOwnerNameAr: json["stpSalOwnerNameAr"],
        stpSalLongitude: json["stpSalLongitude"],
        stpSalLatitude: json["stpSalLatitude"],
        stpSalCountryId: json["stpSalCountryId"],
        stpSalGpsLocation: json["stpSalGpsLocation"],
        stpSalSalonsStatusDate: json["stpSalSalonsStatusDate"],
        stpSalShopPicture: json["stpSalShopPicture"],
        stpSalSalonNoteAbout: json["stpSalSalonNoteAbout"],
        stpSalCreatedBy: json["stpSalCreatedBy"],
        stpSalUpdatedBy: json["stpSalUpdatedBy"],
        stpSalUpdatedOn: json["stpSalUpdatedOn"],
        stpSalCreatedOn: json["stpSalCreatedOn"],
      );

  Map<String, dynamic> toJson() => {
        "salonRate": salonRate,
        "stpSalEmail": stpSalEmail,
        "stpSalCityId": stpSalCityId,
        "stpSalId": stpSalId,
        "stpSalNameAr": stpSalNameAr,
        "stpSalType": stpSalType,
        "stpSalPhoneNumber": stpSalPhoneNumber,
        "stpSalVocationalLicense": stpSalVocationalLicense,
        "stpSalSalonsStatus": stpSalSalonsStatus,
        "stpSalUsername": stpSalUsername,
        "stpSalBranchId": stpSalBranchId,
        "stpSalQrKeyCode": stpSalQrKeyCode,
        "stpSalOwnerNameAr": stpSalOwnerNameAr,
        "stpSalLongitude": stpSalLongitude,
        "stpSalLatitude": stpSalLatitude,
        "stpSalCountryId": stpSalCountryId,
        "stpSalGpsLocation": stpSalGpsLocation,
        "stpSalSalonsStatusDate": stpSalSalonsStatusDate,
        "stpSalShopPicture": stpSalShopPicture,
        "stpSalSalonNoteAbout": stpSalSalonNoteAbout,
        "stpSalCreatedBy": stpSalCreatedBy,
        "stpSalUpdatedBy": stpSalUpdatedBy,
        "stpSalUpdatedOn": stpSalUpdatedOn,
        "stpSalCreatedOn": stpSalCreatedOn,
      };
}
