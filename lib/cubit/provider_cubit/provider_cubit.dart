import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/provider_cubit/provider_states.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_items_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_menu_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_orders_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_tracking_screen.dart';
import 'package:work/view/provider_screens/bottom_navigation_screens/provider_warehouse_screen.dart';

class ProviderCubit extends Cubit<ProviderStates>{
  ProviderCubit(): super(ProviderInitialState());

  static ProviderCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    ProviderMenuScreen(),
    ProviderTrackingScreen(),
    ProviderOrdersScreen(),
    ProviderItemsScreen(),
    ProviderWarehouseScreen()
  ];

  int selectedIndex = 4;
  void changeNavBar(int value) {
    selectedIndex = value;
    emit(ProviderBottomNavState());
  }

}