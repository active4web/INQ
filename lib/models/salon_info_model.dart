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
    this.stpSalId,
    this.salonRate,
    this.stpSalUsername,
    this.stpSalBranchId,
    this.stpSalQrKeyCode,
    this.stpSalNameAr,
    this.stpSalNameLt,
    this.stpSalOwnerNameAr,
    this.stpSalOwnerNameLt,
    this.stpSalPhoneNumber,
    this.stpSalEmail,
    this.stpSalVocationalLicense,
    this.stpSalSalonsStatus,
    this.stpSalSalonsStatusDate,
    this.stpSalShopPicture,
    this.stpSalCountryId,
    this.stpSalCityId,
    this.stpSalType,
    this.stpSalGpsLocation,
    this.stpSalLongitude,
    this.stpSalLatitude,
    this.stpSalSalonNoteAbout,
    this.stpSalCreatedBy,
    this.stpSalCreatedOn,
    this.stpSalUpdatedBy,
    this.stpSalUpdatedOn,
  });

  dynamic salonRate;
  int stpSalId;
  String stpSalUsername;
  int stpSalBranchId;
  String stpSalQrKeyCode;
  String stpSalNameAr;
  String stpSalNameLt;
  String stpSalOwnerNameAr;
  String stpSalOwnerNameLt;
  String stpSalPhoneNumber;
  String stpSalEmail;
  String stpSalVocationalLicense;
  int stpSalSalonsStatus;
  int stpSalSalonsStatusDate;
  String stpSalShopPicture;
  int stpSalCountryId;
  int stpSalCityId;
  int stpSalType;
  String stpSalGpsLocation;
  String stpSalLongitude;
  String stpSalLatitude;
  String stpSalSalonNoteAbout;
  String stpSalCreatedBy;
  int stpSalCreatedOn;
  String stpSalUpdatedBy;
  int stpSalUpdatedOn;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stpSalId: json["stpSalId"],
        salonRate: json["salonRate"],
        stpSalUsername: json["stpSalUsername"],
        stpSalBranchId: json["stpSalBranchId"],
        stpSalQrKeyCode: json["stpSalQrKeyCode"],
        stpSalNameAr: json["stpSalNameAr"],
        stpSalNameLt: json["stpSalNameLt"],
        stpSalOwnerNameAr: json["stpSalOwnerNameAr"],
        stpSalOwnerNameLt: json["stpSalOwnerNameLt"],
        stpSalPhoneNumber: json["stpSalPhoneNumber"],
        stpSalEmail: json["stpSalEmail"],
        stpSalVocationalLicense: json["stpSalVocationalLicense"],
        stpSalSalonsStatus: json["stpSalSalonsStatus"],
        stpSalSalonsStatusDate: json["stpSalSalonsStatusDate"],
        stpSalShopPicture: json["stpSalShopPicture"],
        stpSalCountryId: json["stpSalCountryId"],
        stpSalCityId: json["stpSalCityId"],
        stpSalType: json["stpSalType"],
        stpSalGpsLocation: json["stpSalGpsLocation"] == null
            ? null
            : json["stpSalGpsLocation"],
        stpSalLongitude:
            json["stpSalLongitude"] == null ? null : json["stpSalLongitude"],
        stpSalLatitude:
            json["stpSalLatitude"] == null ? null : json["stpSalLatitude"],
        stpSalSalonNoteAbout: json["stpSalSalonNoteAbout"] == null
            ? null
            : json["stpSalSalonNoteAbout"],
        stpSalCreatedBy: json["stpSalCreatedBy"],
        stpSalCreatedOn: json["stpSalCreatedOn"],
        stpSalUpdatedBy: json["stpSalUpdatedBy"],
        stpSalUpdatedOn: json["stpSalUpdatedOn"],
      );

  Map<String, dynamic> toJson() => {
        "stpSalId": stpSalId,
        "salonRate": salonRate,
        "stpSalUsername": stpSalUsername,
        "stpSalBranchId": stpSalBranchId,
        "stpSalQrKeyCode": stpSalQrKeyCode,
        "stpSalNameAr": stpSalNameAr,
        "stpSalNameLt": stpSalNameLt,
        "stpSalOwnerNameAr": stpSalOwnerNameAr,
        "stpSalOwnerNameLt": stpSalOwnerNameLt,
        "stpSalPhoneNumber": stpSalPhoneNumber,
        "stpSalEmail": stpSalEmail,
        "stpSalVocationalLicense": stpSalVocationalLicense,
        "stpSalSalonsStatus": stpSalSalonsStatus,
        "stpSalSalonsStatusDate": stpSalSalonsStatusDate,
        "stpSalShopPicture": stpSalShopPicture,
        "stpSalCountryId": stpSalCountryId,
        "stpSalCityId": stpSalCityId,
        "stpSalType": stpSalType,
        "stpSalGpsLocation":
            stpSalGpsLocation == null ? null : stpSalGpsLocation,
        "stpSalLongitude": stpSalLongitude == null ? null : stpSalLongitude,
        "stpSalLatitude": stpSalLatitude == null ? null : stpSalLatitude,
        "stpSalSalonNoteAbout":
            stpSalSalonNoteAbout == null ? null : stpSalSalonNoteAbout,
        "stpSalCreatedBy": stpSalCreatedBy,
        "stpSalCreatedOn": stpSalCreatedOn,
        "stpSalUpdatedBy": stpSalUpdatedBy,
        "stpSalUpdatedOn": stpSalUpdatedOn,
      };
}
