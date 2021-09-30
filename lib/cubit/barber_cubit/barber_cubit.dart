import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/provider_cubit/provider_states.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_home_screen.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_menu_screen.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_offers_screen.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_reservation_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_items_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_menu_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_orders_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_tracking_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_warehouse_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_home_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_menu_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_reservations_screen.dart';

import 'barber_states.dart';

class BarberCubit extends Cubit<BarberStates>{
  BarberCubit(): super(BarberInitialState());

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

}