import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/models/auth_models/login_success_model.dart';
import 'package:work/models/auth_models/response_fail_model.dart';
import 'package:work/models/auth_models/response_model.dart';
import 'package:work/models/auth_models/signup_success_model.dart';
import 'package:work/models/service_model.dart';
import 'package:work/models/system_code_response_model.dart';
import 'package:work/network/remote/dio_helper.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/shared/get_sys_codes.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(LoginInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  bool showPassword = true;
  IconData passwordIcon = Icons.visibility;
  void changePasswordVisibility() {
    showPassword = !showPassword;
    passwordIcon = showPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }

  ServiceModel genders;
  ServiceModel countries;
  ServiceModel cities;

  void getSysData() async {
    genders = await getSysCodes(scType: 2);
    countries = await getSysCodes(scType: 6);
    cities = await getSysCodes(scType: 7);
    print(countries.data[0].scArDesc);
    emit(GetSysDataSuccessState());
  }

  var createOtpResponse;
  void createOtp({var phone}) {
    emit(CreateOtpLoadingState());
    DioHelper.getData(url: 'CoreService/createOTP', query: {
      'mobileNumberOrEmail': phone,
      'service': 'SINGUP',
      'accessType': 'MOBILE'
    }).then((value) {
      createOtpResponse = value.data;
      print(value.data);
      emit(CreateOtpSuccessState());
    }).catchError((error) {
      emit(CreateOtpErrorState());
      print(error);
    });
  }

  var checkOtpResponse;
  void checkOtp({var otpValue, String usrName, var phone}) {
    emit(CheckOtpLoadingState());
    DioHelper.getData(url: 'CoreService/checkOTP', query: {
      'otpValue': otpValue,
      'username': usrName,
      'accessType': 'MOBILE',
      'mobileNumber': phone
    }).then((value) {
      createOtpResponse = value.data;
      print(value.data);
      if (value.data['status'] == true) {
        emit(CheckOtpSuccessState());
      } else
        emit(CheckOtpErrorState());
    }).catchError((error) {
      emit(CheckOtpErrorState());
      print(error);
    });
  }

  var lat, long;
  String location;

  ResponseFailModel signUpFailModel;
  SignUpSuccessModel signUpSuccessModel;
  ResponseModel signUpResponseModel;
  void signUp({
    var otpValue,
    String userName,
    String password,
    String email,
    String mobile,
    String userType,
    String clientFullName,
    int countryId,
    int cityId,
    int placeId,
    int genderId,
    String latitude,
    String longitude,
    File usrImage,
  }) {
    // final bytes = usrImage.readAsBytesSync();
    // String _img64 = base64Encode(bytes);
    // print(_img64);
    // print(lat);
    // print(long);
    emit(SignupLoadingState());
    DioHelper.postData(url: 'CoreService/signup', query: {
      'otpValue': otpValue,
      'accessType': 'MOBILE',
    }, data: {
      "usrName": userName,
      "usrPswd": password,
      "usrEmail": email,
      "usrEnFullName": clientFullName,
      "usrMobile": mobile,
      "usrType": userType,
      "usrCountry": {"scType": 6, "scCode": countryId},
      "usrCity": {"scType": 7, "scCode": cityId},
      "usrPlace": {"scType": 8, "scCode": 1},
      "usrGender": {"scType": 2, "scCode": genderId},
      // "usrLongitude": long.toString(),
      // "usrLatitude": lat.toString(),
      // "usrPic1Path": _img64,
      "usrActive": "1"
    }).then((value) {
      print(value.data);
      if (value.data['status'] == true) {
        signUpSuccessModel = SignUpSuccessModel.fromJson(value.data);
        emit(SignupSuccessState());
      }
      if (value.data['status'] == false) {
        signUpFailModel = ResponseFailModel.fromJson(value.data);
        emit(SignupErrorState());
      }
      //signUpResponseModel = ResponseModel.fromJson(value.data);
    }).catchError((error) {
      emit(SignupErrorState());
      print(error);
    });
  }

  ResponseModel salonIdResponse;
  void insertSalon({
    String salonUserName,
    String salonName,
    String ownerName,
    String phone,
    String email,
    File licenceImage,
    File salonImage,
    int country,
    int city,
    int gender,
    String aboutSalon,
  }) {
    Uint8List licenceImageBytes = licenceImage.readAsBytesSync();
    String licenceImageString = base64Encode(licenceImageBytes);

    Uint8List salonImageBytes = salonImage.readAsBytesSync();
    String salonImageString = base64Encode(salonImageBytes);

    emit(InsertSalonLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/generateSalCode', query: {
      'accessType': 'MOBILE',
    }).then((qrCode) {
      print(qrCode.data['data']);
      DioHelper.postData(url: 'ShopServiceSetup/insertStpSalSalons', query: {
        'accessType': 'MOBILE',
        'language': 'en'
      }, data: {
        "StpSalUsername": salonUserName,
        "StpSalBranchId": "1",
        "StpSalQrKeyCode": qrCode.data['data'],
        "StpSalNameAr": salonName,
        "StpSalOwnerNameAr": ownerName,
        "StpSalPhoneNumber": phone,
        "StpSalEmail": email,
        "StpSalVocationalLicense": licenceImageString,
        "StpSalSalonsStatus": "1",
        "StpSalShopPicture": salonImageString,
        "StpSalCountryId": country.toString(),
        "StpSalCityId": city.toString(),
        "StpSalType": gender.toString(),
        "StpSalGpsLocation": location,
        "StpSalLongitude": lat.toString(),
        "StpSalLatitude": long.toString(),
        "StpSalSalonNoteAbout": aboutSalon,
        "SalonRate": "0",
        "StpFavId": "0"
      }).then((value) {
        salonIdResponse = ResponseModel.fromJson(value.data);
        print(value.data);
        if (value.data['status'] == true) {
          emit(InsertSalonSuccessState());
        } else
          emit(InsertSalonErrorState());
      }).catchError((error) {
        emit(InsertSalonErrorState());
        print(error.toString());
      });
    }).catchError((error) {
      emit(InsertSalonErrorState());
      print(error.toString());
    });
  }

  void insertBarber(
      {String barberUserName,
      String barberName,
      String email,
      int gender,
      String yearsOfExperience,
      File barberImage}) {
    Uint8List barberImageBytes = barberImage.readAsBytesSync();
    String barberImageString = base64Encode(barberImageBytes);
    emit(InsertBarberLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/generateBarCode', query: {
      'accessType': 'MOBILE',
    }).then((qrCode) {
      print(qrCode.data['data']);
      DioHelper.postData(url: 'ShopServiceSetup/insertStpSalBarbers', query: {
        'accessType': 'MOBILE',
        'language': 'en'
      }, data: {
        "StpSalId": "0",
        "StpSbrBranchId": "0",
        "StpSbrUsername": barberUserName,
        "StpSalQrKeyCode": qrCode.data['data'],
        "StpSbrNameAr": barberName,
        "StpSbrNameLt": barberName,
        "StpSbrEmail": email,
        "StpSbrGender": gender.toString(),
        "StpSbrYearsOfExperience": yearsOfExperience,
        "StpSbrPersonalPhoto": barberImageString,
        "StpSbrCv": fileToString,
        "StpSbrStatus": "1",
        "StpSbrStatusDate": ""
      }).then((value) {
        print(value.data);
        if (value.data['status'] == true) {
          emit(InsertBarberSuccessState());
        } else
          emit(InsertBarberErrorState());
      }).catchError((error) {
        emit(InsertBarberErrorState());
        print(error);
      });
    }).catchError((error) {
      emit(InsertBarberErrorState());
      print(error);
    });
  }

  LoginSuccessModel loginSuccessModel;
  ResponseFailModel responseFailModel;
  ResponseModel responseModel;
  void login({@required String usrName, @required String password}) {
    emit(LoginLoadingState());
    DioHelper.getData(url: 'CoreService/login', query: {
      'username': usrName,
      'password': password,
      'accessType': 'MOBILE',
      'mobileAppVersion': '1.0',
    }).then((value) {
      //responseModel = ResponseModel.fromJson(value.data);
      print(value.data);
      if (value.data['status'] == true) {
        loginSuccessModel = LoginSuccessModel.fromJson(value.data);
        emit(LoginSuccessState(loginModel: loginSuccessModel));
      }
      if (value.data['status'] == false) {
        responseFailModel = ResponseFailModel.fromJson(value.data);
        emit(LoginErrorState(error: responseFailModel));
      }
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  String fileToString;
  String fileName;
  void pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    Uint8List fileBytes = result.files.first.bytes;
    fileName = result.files.first.name;
    if (fileBytes != null) fileToString = base64Encode(fileBytes);
    print(fileName);
    emit(PickFileSuccessState());
  }

  Future<XFile> pickImage(file) async {
    final ImagePicker _picker = ImagePicker();
    file = await _picker.pickImage(source: ImageSource.gallery);
    print(file.path);
    emit(PickImageSuccessState());
    return file;
  }
}
