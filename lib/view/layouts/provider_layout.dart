import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/provider_cubit/provider_cubit.dart';
import 'package:work/cubit/provider_cubit/provider_states.dart';
import 'package:work/cubit/user_cubit/user_cubit.dart';
import 'package:work/cubit/user_cubit/user_states.dart';
import 'package:work/shared/custom_icons.dart';

class ProviderLayout extends StatelessWidget {
  ProviderLayout({Key key, this.selectedIndex}) : super(key: key);

  static const String id = 'ProviderLayout';

  int selectedIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProviderCubit,ProviderStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ProviderCubit cubit = ProviderCubit.get(context);
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
                        icon: Icon(CustomIcons.delivery_truck), label: 'تتبع الطلب'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.orders),
                        label: 'الطلبات'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.shaving_cream),
                        label: 'العناصر'),
                    BottomNavigationBarItem(
                        icon: Icon(CustomIcons.warehouse), label: 'المخزن'),
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
