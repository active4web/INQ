

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/user_cubit/user_states.dart';

class UserCubit extends Cubit<UserStates>{
  UserCubit(): super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  int selectedIndex = 3;
  void changeNavBar(int value) {
    selectedIndex = value;
    emit(UserBottomNavState());
  }

}