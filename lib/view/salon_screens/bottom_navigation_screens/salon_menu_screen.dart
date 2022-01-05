import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/salon_screens/salon_menu_screens/attendance_qr_code_screen.dart';
import 'package:work/view/salon_screens/salon_menu_screens/salon_branches_screen.dart';
import 'package:work/view/salon_screens/salon_menu_screens/salon_complaints_screen.dart';
import 'package:work/view/salon_screens/salon_menu_screens/salon_order_screen.dart';
import 'package:work/view/salon_screens/salon_menu_screens/salon_satatistics_screen.dart';
import 'package:work/view/salon_screens/salon_menu_screens/salon_services_screen.dart';
import 'package:work/view/salon_screens/salon_menu_screens/salon_settings_screen.dart';
import 'package:work/view/salon_screens/salon_menu_screens/salon_subscriptions_screen.dart';
import 'package:work/view/salon_screens/salon_profile_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_menu_screen.dart';

class SalonMenuScreen extends StatelessWidget {
  const SalonMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: BlocBuilder<SalonCubit, SalonStates>(
        builder: (context, state) {
          SalonCubit cubit = SalonCubit.get(context);
          Uint8List bytes =
              Base64Codec().decode(cubit.mySalonInfo.data[0].stpSalShopPicture);
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height + 200,
              child: Stack(
                overflow: Overflow.visible,
                fit: StackFit.loose,
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 270,
                          padding: EdgeInsets.symmetric(horizontal: 35),
                          color: kLightGreenColor,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 90,
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: MemoryImage(bytes),
                                            fit: BoxFit.cover),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        cubit.mySalonInfo.data[0]
                                                .stpSalNameAr ??
                                            '',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          navigateTo(
                                              context, SalonProfileScreen());
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'ادارة الحساب',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10),
                                          )),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container()
                      ],
                    ),
                  ),
                  Positioned(
                    top: 220,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        // margin: EdgeInsets.only(top: 220,),
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.grey, blurRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          children: [
                            MenuItem(
                              label: "تحليل الزيارات",
                              onTab: () {
                                navigateTo(context, SalonStatisticsScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "الخدمات",
                              onTab: () {
                                navigateTo(context, SalonServicesScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "ادارة الفروع",
                              onTab: () {
                                navigateTo(context, SalonBranchesScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "الاشتراكات",
                              onTab: () {
                                navigateTo(context, SalonSubscriptionsScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "المصروفات",
                              onTab: () {
                                //navigateTo(context, AccountStatementScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "المخازن",
                              onTab: () {
                                navigateTo(context, SalonOrderScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "QR الحضور",
                              onTab: () {
                                navigateTo(context, AttendanceQRCodeScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "اعدادات الخصوصية",
                              onTab: () {
                                navigateTo(context, SalonSettingsScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "الشكاوي و الاقتراحات",
                              onTab: () {
                                navigateTo(context, SalonComplaintsScreen());
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextButton(
                                onPressed: () {
                                  logOut(context);
                                },
                                child: Text(
                                  'تسجيل الخروج',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
