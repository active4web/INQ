import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/models/salon_info_model.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/shared/custom_icons.dart';

class SalonLayout extends StatelessWidget {
  const SalonLayout({Key key}) : super(key: key);

  static const String id = 'SalonLayout';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalonCubit, SalonStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SalonCubit cubit = SalonCubit.get(context);
        return Scaffold(
          body: IndexedStack(
            children: cubit.screens,
            index: cubit.selectedIndex,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Container(
                height: 70,
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  currentIndex: cubit.selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    cubit.changeNavBar(value);
                  },
                  elevation: 30,
                  unselectedFontSize: 13,
                  unselectedItemColor: Colors.grey,
                  selectedFontSize: 13,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.more_vert_rounded), label: 'المزيد'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.barber), label: 'الحلاقين'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.appointment), label: 'الحجوزات'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.offers), label: 'العروض'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.hair_salon), label: 'الرئيسية'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
