

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/user_cubit/user_states.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_home_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_menu_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_reservations_screen.dart';

class UserCubit extends Cubit<UserStates>{
  UserCubit(): super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    UserMenuScreen(),
    ProfileScreen(),
    Scaffold(),
    UserReservationScreen(),
    UserHomeScreen()
  ];

  int selectedIndex = 4;
  void changeNavBar(int value) {
    selectedIndex = value;
    emit(UserBottomNavState());
  }

}