import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class CustomerServicesScreen extends StatelessWidget {
  const CustomerServicesScreen({Key key}) : super(key: key);
  static const String id = 'CustomerServicesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black87,),
        ),
        title: Text('خدمة العملاء',style: TextStyle(
            color: Colors.black87
        ),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(

                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kGreyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text('التواصل',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                          fontSize: 17,
                          color: kDarkBlueColor
                        ),),
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(CupertinoIcons.phone,color: kGreyColor
                          ,size: 24,),
                        SizedBox(width: 40,),
                        Text('+962 1256 7592',style: TextStyle(
                          fontSize: 16
                        ),)
                      ],
                    ),
                    SizedBox(height: 12,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(FontAwesomeIcons.globe,color: kGreyColor
                          ,size: 24,),
                        SizedBox(width: 40,),
                        Text('www.margueritesalon.com',style: TextStyle(
                            fontSize: 14
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 35,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text('الشكاوي',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 18,
                        color: kDarkBlueColor
                    ),),
                ],
              ),
              SizedBox(height: 20,),
              CustomFormField(label: 'اسم الحلاق',),
              SizedBox(height: 16,),
              CustomFormField(label: 'الشكوي',),
              SizedBox(height: 20,),
              CustomButton(label: 'ارسال',)
            ],
          ),
        )
      ),
    );
  }
}
