import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/models/salon_info_model.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/network/remote/dio_helper.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_barbers_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_home_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_menu_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_offers_screen.dart';
import 'package:work/view/salon_screens/bottom_navigation_screens/salon_reservations_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_home_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_menu_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_reservations_screen.dart';

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
      CacheHelper.setData(key: 'salonInfo', value: jsonEncode(mySalonInfoModel))
          .then((value) {
        mySalonInfo = SalonInfoModel.fromJson(
            jsonDecode(CacheHelper.getData('salonInfo')));
      });
    }).catchError((error) {
      emit(GetMySalonInfoErrorState());
      print(error.toString());
    });
  }

  void fetchData() {
    // getMySalonInfo();
  }
}

enum OfferTime { Monthly, Weekly, Daily }
