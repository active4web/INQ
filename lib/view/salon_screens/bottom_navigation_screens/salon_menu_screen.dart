import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/barber_screens/account_statement_screen.dart';
import 'package:work/view/barber_screens/barber_services_screen.dart';
import 'package:work/view/barber_screens/settings_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_menu_screen.dart';

class SalonMenuScreen extends StatelessWidget {
  const SalonMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height+200,
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
                          SizedBox(height: 90,),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('Assets/images/Avatar.png')
                                    ),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text('INQ Salon',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                  ),),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(child: Text('ادارة الحساب'
                                      ,textDirection: TextDirection.rtl,style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                        fontSize: 10
                                      ),)),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                    )
                  ],
                ),
              ),
              Positioned(
                top: 220,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    // margin: EdgeInsets.only(top: 220,),
                    width: MediaQuery.of(context).size.width*0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1
                      )],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      children: [
                        MenuItem(label: "تحليل الزيارات",
                          onTab: (){
                            //navigateTo(context, BarberServicesScreen());
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "الخدمات",
                          onTab: (){
                            //navigateTo(context, SettingsScreen());
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "ادارة الفروع",
                          onTab: (){
                            // Navigator.pushNamed(context, TermsAndConditionsScreen.id);
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "الاشتراكات",
                          onTab: (){
                            //navigateTo(context, AccountStatementScreen());
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "المصروفات",
                          onTab: (){
                            //navigateTo(context, AccountStatementScreen());
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "المخازن",
                          onTab: (){
                            //navigateTo(context, AccountStatementScreen());
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "QR الحضور",
                          onTab: (){
                            //navigateTo(context, AccountStatementScreen());
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "اعدادات الخصوصية",
                          onTab: (){
                            //navigateTo(context, AccountStatementScreen());
                          },),
                        SizedBox(height: 14,),
                        MenuItem(label: "الشكاوي و الاقتراحات",
                          onTab: (){
                            //navigateTo(context, AccountStatementScreen());
                          },),

                        SizedBox(height: 30,),
                        TextButton(onPressed: (){}, child: Text('تسجيل الخروج',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
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
