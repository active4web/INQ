import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/models/salon_info_model.dart';
import 'package:work/models/salon_services_model.dart';
import 'package:work/models/service_model.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/network/remote/dio_helper.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/get_sys_codes.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_barbers_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_home_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_menu_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_offers_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_reservations_screen.dart';

class SalonCubit extends Cubit<SalonStates> {
  SalonCubit() : super(SalonInitialState());

  static SalonCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    SalonMenuScreen(),
    SalonBarbersScreen(),
    SalonReservationsScreen(),
    SalonOffersScreen(),
    SalonHomeScreen(),
  ];

  int selectedIndex = 4;
  void changeNavBar(int value) {
    selectedIndex = value;
    emit(SalonBottomNavState());
  }

  // String userName;
  SalonInfoModel mySalonInfo;

  SalonInfoModel mySalonInfoModel;
  void getMySalonInfo({String userName}) {
    emit(GetMySalonInfoLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/getSalonInfo', query: {
      'accessType': 'MOBILE',
      'uuidToken': kToken,
      'username': userName
    }).then((value) {
      print(value.data);
      mySalonInfoModel = SalonInfoModel.fromJson(value.data);
      emit(GetMySalonInfoSuccessState());
      CacheHelper.setData(
          key: 'salonInfo', value: jsonEncode(mySalonInfoModel));
    }).catchError((error) {
      emit(GetMySalonInfoErrorState());
      print(error.toString());
    });
  }

  SalonServicesModel salonServicesModel;
  void getSalonServices() {
    emit(GetSalonServicesLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/getSalonServices', query: {
      'accessType': "MOBILE",
      'uuidToken': kToken,
      'stpSalId': mySalonInfo.data[0].stpSalId
    }).then((value) {
      print(value.data);
      salonServicesModel = SalonServicesModel.fromJson(value.data);
      if (value.data['status'] == true)
        emit(GetSalonServicesSuccessState());
      else
        emit(GetSalonServicesErrorState());
    }).catchError((error) {
      emit(GetSalonServicesErrorState());
      print(error);
    });
  }

  ServiceModel servicesCodes;
  void getSysData() async {
    servicesCodes = await getSysCodes(scType: 10059);
    emit(GetSysCodesSuccessState());
  }

  void insertSalonService({int salId, serviceId, neededHours, neededMinutes}) {
    emit(InsertSalonServiceLoadingState());
    DioHelper.postData(url: 'ShopServiceSetup/insertStpSalServices', query: {
      'accessType': "MOBILE",
      'uuidToken': kToken,
      'language': 'ar'
    }, data: {
      "StpSalId": salId,
      "StpSpnBranchId": "1",
      "StpSsrServicesId": serviceId,
      "StpSsrNeedTimeHoure": neededHours,
      "StpSsrNeedTimeMinut": neededMinutes
    }).then((value) {
      if (value.data['status'] == true)
        emit(InsertSalonServiceSuccessState());
      else
        emit(InsertSalonServiceErrorState());
    }).catchError((error) {
      emit(InsertSalonServiceErrorState());
      print(error);
    });
  }

  void updateSalonService(
      {int salId, stpSsrId, neededHours, stpSsrServicesId, neededMinutes}) {
    emit(UpdateSalonServiceLoadingState());
    DioHelper.postData(url: 'ShopServiceSetup/updateStpSalServices', query: {
      'accessType': "MOBILE",
      'uuidToken': kToken,
      'language': 'ar'
    }, data: {
      "stpSsrId": stpSsrId,
      "stpSalId": salId,
      "stpSsrNeedTimeHoure": neededHours,
      "stpSpnBranchId": "1",
      "stpSsrNeedTimeMinut": neededMinutes,
      "stpSsrServicesId": stpSsrServicesId
    }).then((value) {
      if (value.data['status'] == true)
        emit(UpdateSalonServiceSuccessState());
      else
        emit(UpdateSalonServiceErrorState());
    }).catchError((error) {
      emit(UpdateSalonServiceErrorState());
      print(error);
    });
  }

  void deleteSalonService({int serviceId}) {
    emit(DeleteSalonServiceLoadingState());
    DioHelper.postData(url: 'ShopServiceSetup/deleteStpSalServices', query: {
      'accessType': "MOBILE",
      'uuidToken': kToken,
      'language': 'ar',
      'stpSsrId': serviceId
    }).then((value) {
      print(value.data);
      value.data['data'] == true
          ? emit(DeleteSalonServiceSuccessState())
          : emit(DeleteSalonServiceErrorState());
    }).catchError((error) {
      emit(DeleteSalonServiceErrorState());
      print(error);
    });
  }

  Uint8List salonQrImage;
  Future<void> generateSalonQrCode() async {
    salonQrImage =
        await scanner.generateBarCode(mySalonInfo.data[0].stpSalQrKeyCode);
    emit(GenerateCodeSuccessState());
  }

  void getCache() {
    mySalonInfo =
        SalonInfoModel.fromJson(jsonDecode(CacheHelper.getData('salonInfo')));
  }

  void fetchData() {
    // getMySalonInfo();
    getCache();
    getSysData();
  }
}

enum OfferTime { Monthly, Weekly, Daily }
