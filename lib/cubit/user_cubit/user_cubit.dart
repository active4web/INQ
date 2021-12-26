import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/user_cubit/user_states.dart';
import 'package:work/models/auth_models/login_success_model.dart';
import 'package:work/models/auth_models/response_model.dart';
import 'package:work/models/salon_info_model.dart';
import 'package:work/models/user_models/barbers_by_salon_model.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/network/remote/dio_helper.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_home_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_menu_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_reservations_screen.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    UserMenuScreen(),
    ProfileScreen(),
    Scaffold(),
    UserReservationScreen(),
    UserHomeScreen()
  ];

  LoginSuccessModel userinfo =
      LoginSuccessModel.fromJson(jsonDecode(CacheHelper.getData('userInfo')));

  int selectedIndex = 4;
  void changeNavBar(int value) {
    selectedIndex = value;
    emit(UserBottomNavState());
  }

  SalonInfoModel salonInfoModel;
  void getSalonInfo() {
    emit(GetSalonInfoLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/getSalonInfo', query: {
      'accessType': 'MOBILE',
      'uuidToken': kToken,
      'stpSalId': null,
      'username': null
    }).then((value) {
      print(value.data);
      salonInfoModel = SalonInfoModel.fromJson(value.data);
      emit(GetSalonInfoSuccessState());
    }).catchError((error) {
      emit(GetSalonInfoErrorState());
      print(error.toString());
    });
  }

  ResponseModel ratingModel;
  double salonRating = 0.0;
  void getSalonRating({int salId, branchId}) {
    DioHelper.getData(url: 'ShopServiceRate/getRateSalon', query: {
      'accessType': 'MOBILE',
      'uuidToken': kToken,
      'stpSalId': salId,
      'ratRasBranchId': 1
    }).then((value) {
      // ratingModel = ResponseModel.fromJson(value.data);
      if (value.data['status'] == true) {
        print(value.data);
        salonRating = 0.0;
        salonRating = value.data['data'];
        emit(GetSalonRatingSuccessState());
      }
    });
  }

  BarbersBySalonModel barbersBySalonModel;
  void getBarbersBySalon({int stpPsId, stpPrvId}) {
    emit(GetBarbersBySalonLoadingState());
    DioHelper.getData(url: 'ShopServiceSetup/getBarbersOnSalon', query: {
      'accessType': 'MOBILE',
      'uuidToken': kToken,
      'stpPspId': stpPsId,
      'stpPrvId': stpPrvId,
    }).then((value) {
      barbersBySalonModel = BarbersBySalonModel.fromJson(value.data);
      emit(GetBarbersBySalonSuccessState());
    }).catchError((error) {
      emit(GetBarbersBySalonErrorState());
      print(error.toString());
    });
  }

  void fetchData() {
    getSalonInfo();
  }
}
