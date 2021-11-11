import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/auth_screens/signup_screens/signup_barber_account_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_provider_account_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_salon_account_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_user_account_screen.dart';
import 'package:work/view/barber_screens/bottom_navigation_screens/barber_home_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignUpAccountTypeScreen extends StatelessWidget {
  const SignUpAccountTypeScreen({Key key, this.usrName, this.fullName, this.phone, this.email, this.password}) : super(key: key);

  final usrName;
  final fullName;
  final phone;
  final email;
  final password;
  //static const String id = "signupScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
              Icons.arrow_back,
              color: kDarkBlueColor,
          ),
        ),
        title:Text('تسجيل مشترك جديد', style:TextStyle(
          color: kDarkBlueColor
        ),),
      ),
      body: Column(
        children: [
          // Container(
          //   color: Colors.white,
          //   height: 80,
          //   child: Column(
          //     children: [
          //       Directionality(
          //         textDirection: TextDirection.rtl,
          //         child:
          //         NumberStepper(
          //           numbers: [1,2,3],
          //           numberStyle: TextStyle(color: Colors.transparent),
          //           stepColor: Color(0xffC5CEE0),
          //           lineColor: Color(0xffC5CEE0),
          //           lineLength: 120,
          //           direction: Axis.horizontal,
          //           stepRadius: 10,
          //           enableNextPreviousButtons: false,
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 16),
          //         child: Row(
          //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           textDirection: TextDirection.rtl,
          //           children: [
          //             Text('معلومات الحساب',textDirection: TextDirection.rtl,),
          //             SizedBox(width: 50,),
          //             Text('نوع الحساب',textDirection: TextDirection.rtl,),
          //             SizedBox(width: 80,),
          //             Text('انهاء',textDirection: TextDirection.rtl,)
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Label(text: 'حدد نوع الحساب',),
                    SizedBox(height: 50,),
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 20,
                      children: [
                        SquareTile(label: 'صالون',
                          icon: CustomIcons.hair_salon,
                          onTab: (){
                          navigateTo(context, SignUpSalonAccountScreen());
                          },),
                        SquareTile(label: 'مستخدم',
                          onTab: (){
                          navigateTo(context, SignupUserAccountScreen(
                            email: email,
                            phone: phone,
                            usrName: usrName,
                            password: password,
                            fullName: fullName,
                            usrType: 'CUSTOMER',
                          ));
                          },
                          icon: CustomIcons.man,),
                        SquareTile(label: 'موردين',
                          onTab: (){
                          navigateTo(context, SignupProviderAccountScreen());
                          },
                          icon: CustomIcons.shaving_cream,),
                        SquareTile(label: 'حلاق',
                          onTab: (){
                          navigateTo(context, SignupBarberAccountScreen());
                          },
                          icon: CustomIcons.barber,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
