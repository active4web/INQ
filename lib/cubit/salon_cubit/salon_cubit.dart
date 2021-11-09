import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
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
}

enum OfferTime { Monthly, Weekly, Daily }
