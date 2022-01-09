import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/models/barber_info_model.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/network/remote/dio_helper.dart';
import 'package:work/shared/constants.dart';
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
  BarberInfoModel _barberInfoModel;
  void getBarberInfo({String userName}) {
    emit(GetBarberInfoLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/getBarbersInfo', query: {
      'accessType': 'MOBILE',
      'uuidToken': kToken,
      'username': userName
    }).then((value) {
      _barberInfoModel = BarberInfoModel.fromJson(value.data);
      emit(GetBarberInfoSuccessState());
      CacheHelper.setData(
          key: 'barberInfo', value: jsonEncode(_barberInfoModel));
    }).catchError((error) {
      emit(GetBarberInfoErrorState());
      print(error);
    });
  }

  void getCache() {
    barberInfo =
        BarberInfoModel.fromJson(jsonDecode(CacheHelper.getData('salonInfo')));
  }

  void fetchData() {
    getCache();
  }
}
