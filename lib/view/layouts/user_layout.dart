import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/user_cubit/user_cubit.dart';
import 'package:work/cubit/user_cubit/user_states.dart';
import 'package:work/shared/custom_icons.dart';

class UserLayout extends StatelessWidget {
  UserLayout({Key key, this.selectedIndex}) : super(key: key);

  static const String id = 'userLayout';

  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        UserCubit cubit = UserCubit.get(context);
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
                        icon: Icon(CustomIcons.man), label: 'الملف الشخصي'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.placeholder),
                        label: 'البحث'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.appointment),
                        label: 'الحجوزات'),
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
