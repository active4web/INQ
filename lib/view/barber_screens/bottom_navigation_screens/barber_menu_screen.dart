import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/barber_cubit/barber_cubit.dart';
import 'package:work/cubit/barber_cubit/barber_states.dart';
import 'package:work/models/barber_info_model.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/barber_screens/account_statement_screen.dart';
import 'package:work/view/barber_screens/barber_services_screen.dart';
import 'package:work/view/barber_screens/settings_screen.dart';
import 'package:work/view/provider_screens/provider_subscribers_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_menu_screen.dart';

class BarberMenuScreen extends StatelessWidget {
  const BarberMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: BlocBuilder<BarberCubit, BarberStates>(
        builder: (context, state) {
          BarberCubit cubit = BarberCubit.get(context);
          // Datum data = cubit.barberInfoModel.data[0];
          // Uint8List image = Base64Codec().decode(data.stpSbrPersonalPhoto);
          return /*data == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                )
              : */
              SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
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
                                        color: Colors.white,
                                        // image: DecorationImage(
                                        //     image: MemoryImage(image),
                                        //     fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        'test',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        '@gmail.com',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
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
                              label: "?????????????? ??????????????",
                              onTab: () {
                                navigateTo(context, BarberServicesScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "?????????????? ????????????",
                              onTab: () {
                                navigateTo(context, SettingsScreen());
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "???????? ????????????",
                              onTab: () {
                                // Navigator.pushNamed(context, TermsAndConditionsScreen.id);
                              },
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            MenuItem(
                              label: "?????? ????????",
                              onTab: () {
                                navigateTo(context, AccountStatementScreen());
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
                                  '?????????? ????????????',
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
