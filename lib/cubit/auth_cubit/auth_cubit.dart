import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/models/auth_models/login_success_model.dart';
import 'package:work/models/auth_models/response_fail_model.dart';
import 'package:work/models/auth_models/response_model.dart';
import 'package:work/models/auth_models/signup_success_model.dart';
import 'package:work/models/system_code_response_model.dart';
import 'package:work/network/remote/dio_helper.dart';

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
    final bytes = usrImage.readAsBytesSync();
    String _img64 = base64Encode(bytes);
    print(_img64);
    print(lat);
    print(long);
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

  Future<XFile> pickImage(file) async {
    final ImagePicker _picker = ImagePicker();
    file = await _picker.pickImage(source: ImageSource.gallery);
    print(file.path);
    emit(PickImageSuccessState());
    return file;
  }
}
