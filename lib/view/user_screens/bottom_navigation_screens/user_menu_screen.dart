import 'package:flutter/material.dart';
import 'package:work/cubit/user_cubit/user_cubit.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/user_screens/menu_screens/about_app_screen.dart';
import 'package:work/view/user_screens/menu_screens/customer_services.dart';
import 'package:work/view/user_screens/menu_screens/favourites_screen.dart';
import 'package:work/view/user_screens/menu_screens/privacy_screen.dart';
import 'package:work/view/user_screens/menu_screens/terms_and_conditions_screen.dart';

class UserMenuScreen extends StatelessWidget {
  const UserMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: SingleChildScrollView(
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
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    UserCubit.get(context)
                                        .userinfo
                                        .data
                                        .usrEnFullName,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    UserCubit.get(context)
                                        .userinfo
                                        .data
                                        .usrEmail,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 10,
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
                      boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      children: [
                        // MenuItem(label: '?????????? ??????????',),
                        // SizedBox(height: 14,),
                        MenuItem(
                          label: "??????????????",
                          onTab: () {
                            navigateTo(context, FavouritesScreen());
                          },
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        MenuItem(
                          label: "?????????? ????????????????",
                          onTab: () {
                            navigateTo(context, PrivacyScreen());
                          },
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        MenuItem(
                          label: "???????????? ?? ??????????????",
                          onTab: () {
                            navigateTo(context, TermsAndConditionsScreen());
                          },
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        MenuItem(
                          label: "???????? ??????????????",
                          onTab: () {
                            navigateTo(context, CustomerServicesScreen());
                          },
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        MenuItem(
                          label: "???? ??????????????",
                          onTab: () {
                            navigateTo(context, AboutAppScreen());
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              logOut(context);
                            },
                            child: Text(
                              '?????????? ????????????',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    this.label,
    this.onTab,
  }) : super(key: key);

  final String label;
  final Function onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: kBoxDecoration,
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              label,
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
