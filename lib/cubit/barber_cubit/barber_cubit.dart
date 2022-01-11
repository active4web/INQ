import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/models/barber_info_model.dart';
import 'package:work/models/barber_services_model.dart';
import 'package:work/models/service_model.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/network/remote/dio_helper.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/get_sys_codes.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_home_screen.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_menu_screen.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_offers_screen.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_reservation_screen.dart';

import 'barber_states.dart';

class BarberCubit extends Cubit<BarberStates> {
  BarberCubit() : super(BarberInitialState());

  static BarberCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    BarberMenuScreen(),
    BarberReservationScreen(),
    BarberOffersScreen(),
    BarberHomeScreen()
  ];

  int selectedIndex = 3;
  void changeNavBar(int value) {
    selectedIndex = value;
    emit(BarberBottomNavState());
  }

  BarberInfoModel barberInfo;
  BarberInfoModel barberInfoModel;
  void getBarberInfo({String userName}) {
    emit(GetBarberInfoLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/getBarbersInfo', query: {
      'accessType': 'MOBILE',
      'uuidToken': kToken,
      'username': userName
    }).then((value) {
      print(value.data);
      barberInfoModel = BarberInfoModel.fromJson(value.data);
      emit(GetBarberInfoSuccessState());
      CacheHelper.setData(
          key: 'barberInfo', value: jsonEncode(barberInfoModel));
    }).catchError((error) {
      emit(GetBarberInfoErrorState());
      print(error);
    });
  }

  void getCache() async {
    barberInfo = await BarberInfoModel.fromJson(
        jsonDecode(CacheHelper.getData('barberInfo')));
  }

  ServiceModel servicesCodes;
  void getSysData() async {
    servicesCodes = await getSysCodes(scType: 10059);
    emit(GetBarbersSysCodesSuccessState());
  }

  BarberServicesModel barberServicesModel;
  void getBarberServices() {
    emit(GetBarberServicesLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/getBarbeServices', query: {
      'accessType': "MOBILE",
      'uuidToken': kToken,
      'stpSalId': barberInfoModel.data[0].stpSbrId,
      'language': 'ar'
    }).then((value) {
      print(value.data);
      barberServicesModel = BarberServicesModel.fromJson(value.data);
      if (value.data['status'] == true)
        emit(GetBarberServicesSuccessState());
      else
        emit(GetBarberServicesErrorState());
    }).catchError((error) {
      emit(GetBarberServicesErrorState());
      print(error);
    });
  }

  void insertBarberService(
      {int barberId, serviceId, neededHours, neededMinutes, price}) {
    emit(InsertBarberServiceLoadingState());
    DioHelper.postData(url: 'ShopServiceSetup/insertBarbersServices', query: {
      'accessType': "MOBILE",
      'uuidToken': kToken,
      'language': 'ar'
    }, data: {
      "stpSbrId": barberId,
      "stpSrvId": serviceId,
      "stpSbsBranchId": "1",
      "stpSbsCurrencyId": "1",
      "stpSbsNeededHoure": neededHours,
      "stpSbsNeededMinutes": neededMinutes,
      "stpSbsPrice": price
    }).then((value) {
      if (value.data['status'] == true)
        emit(InsertBarberServiceSuccessState());
      else
        emit(InsertBarberServiceErrorState());
    }).catchError((error) {
      emit(InsertBarberServiceErrorState());
      print(error);
    });
  }

  void deleteBarberService({int serviceId}) {
    emit(DeleteBarberServiceLoadingState());
    DioHelper.postData(url: 'ShopServiceSetup/deleteBarbersServices', query: {
      'accessType': "MOBILE",
      'uuidToken': kToken,
      'language': 'ar',
      'stpSbsId': serviceId
    }).then((value) {
      print(value.data);
      value.data['data'] == true
          ? emit(DeleteBarberServiceSuccessState())
          : emit(DeleteBarberServiceErrorState());
    }).catchError((error) {
      emit(DeleteBarberServiceErrorState());
      print(error);
    });
  }

  void fetchData() {
    getCache();
    getSysData();
  }
}
