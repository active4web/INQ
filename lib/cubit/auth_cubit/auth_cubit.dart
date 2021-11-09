import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/models/response_body_model.dart';
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


  ResponseBodyModel signUpResponse;
  void signUp({
    var otpValue,
    String userName,
    String password,
    String email,
    String mobile,
    String userType,
    String clientFullName,
    String employeeNo,
    String nationalNo,
    int countryId,
    int cityId,
    int placeId,
    int nationalityId,
    int religiousId,
    int genderId,
    int maritalStatusId,
  }){
    emit(SignupLoadingState());
    DioHelper.postData(
      url: 'CoreService/signup',
      query: {
        'otpValue':otpValue,
        'accessType':'MOBILE',
      },
      data: {
        "usrName": userName,
        "usrPswd": password,
        "usrEmail": email,
        "usrEnFullName": clientFullName,
        "usrMobile":mobile,
        "usrType":userType,
        "usrCountry": {
          "scType": 6,
          "scCode": countryId
        },
        "usrCity": {
          "scType": 7,
          "scCode": cityId
        },
        "usrPlace": {
          "scType": 8,
          "scCode": placeId
        },
        "usrNationality": {
          "scType": 9,
          "scCode": nationalityId
        },
        "usrEmployeeNo":employeeNo,
        "usrNationalNo":"9931054201",
        "usrMaritalStatus": {
          "scType": 3,
          "scCode": maritalStatusId
        },
        "usrReligiouse": {
          "scType": 5,
          "scCode": religiousId
        },
        "usrGender": {
          "scType": 2,
          "scCode": genderId
        },
        "usrActive":"1"
      }
    ).then((value) {
      signUpResponse = ResponseBodyModel.fromJson(value.data);
      print(value.data);
      emit(SignupSuccessState());
    }).catchError((error){
      emit(SignupErrorState());
      print(error);
    });
  }






}
