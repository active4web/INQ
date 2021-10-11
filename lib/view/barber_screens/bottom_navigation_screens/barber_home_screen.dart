import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';


class BarberHomeScreen extends StatelessWidget {
  const BarberHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        title: Text('الرئيسية'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Label(text: 'حدد من القائمة',),
              SizedBox(height: 20,),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 20,
                children: [
                  SquareTile(label: 'بيانات الحساب',
                    icon: CustomIcons.hair_salon,),
                  SquareTile(label: 'الحجوزات',
                    icon: CustomIcons.appointment,),
                  SquareTile(label: 'تسجيل الدخول / الخروج',
                    icon: CustomIcons.resign,),
                  SquareTile(label: 'اجازة',
                    icon: CustomIcons.suitcases,),
                ],
              ),
              SizedBox(height: 20,),
              CustomButton(label: 'اتصل بالصالون عن طريق QR code',
              onTab: (){
                showCustomBottomSheet(context: context,
                content: Column(
                  children: [
                    Text('scan Salon QR code for attendance',style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87
                    ),),
                    Container(
                      width: 250,
                      height: 250,
                      margin: EdgeInsets.all(20),
                      color: Colors.black,
                      // child: QRView(
                      //   key: qrKey,
                      //   onQRViewCreated: _onQRViewCreated,
                      // ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.rtl,
                      children: [
                        SizedBox(
                            width: 250,
                            child: CustomButton(label: 'تم',)),
                        SizedBox(width: 20,),
                        CustomCloseButton()
                      ],
                    ),
                  ],
                ));
              },),
              SizedBox(height: 20,),
              CustomWhiteButton(label: 'صالوني الخاص',),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  const SquareTile({
    Key key, this.label, this.icon, this.onTab,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Function onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTab,
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        height: MediaQuery.of(context).size.width*0.4,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            spreadRadius: 0.5
          )]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
            color: kPrimaryColor,
            size: 50,),
            SizedBox(height: 10,),
            Text(label,style: TextStyle(
              color: kPrimaryColor
            ),textDirection: TextDirection.rtl,)
          ],
        ),
      ),
    );
  }
}
