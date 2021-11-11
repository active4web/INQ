import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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

  
  var createOtpResponse;
  void createOtp({
  var phone
}){
    emit(CreateOtpLoadingState());
    DioHelper.getData(
      url: 'CoreService/createOTP',
      query: {
        'mobileNumberOrEmail':phone,
        'service':'SINGUP',
        'accessType':'MOBILE'
      }
    ).then((value){
      createOtpResponse = value.data;
      print(value.data);
      emit(CreateOtpSuccessState());
    }).catchError((error){
      emit(CreateOtpErrorState());
      print(error);
    });
  }

  var checkOtpResponse;
  void checkOtp({
    var otpValue,
    String usrName,
    var phone
  }){
    emit(CheckOtpLoadingState());
    DioHelper.getData(
        url: 'CoreService/checkOTP',
        query: {
          'otpValue': otpValue,
          'username':usrName,
          'accessType':'MOBILE',
          'mobileNumber': phone
        }
    ).then((value){
      createOtpResponse = value.data;
      print(value.data);
      if(value.data['status']==true) {
        emit(CheckOtpSuccessState());
      }else emit(CheckOtpErrorState());
    }).catchError((error){
      emit(CheckOtpErrorState());
      print(error);
    });
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
    int countryId,
    int cityId,
    int placeId,
    int genderId,
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



  Future<XFile> pickImage(file) async {
    final ImagePicker _picker = ImagePicker();
    file = await _picker.pickImage(source: ImageSource.gallery);
    print(file.path);
    emit(PickImageSuccessState());
    return file;
  }


}
