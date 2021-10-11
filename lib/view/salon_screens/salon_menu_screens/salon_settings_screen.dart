import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SalonSettingsScreen extends StatelessWidget {
  const SalonSettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kLightGreenColor,
          title: Text('اعدادات الخصوصية'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Label(text: 'رجاء لا تظهر البيانات التالية',),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16,),
                        Text('رقم الجوال')
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16,),
                        Text('العمر')
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16,),
                        Text('الصورة')
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 27,
                          height: 27,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16,),
                        Text('اسم العائلة')
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
                SizedBox(height: 40,),
                Label(text: 'اعدادات حساب الحلاق',),
                SizedBox(height: 10,),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Container(
                      width: 27,
                      height: 27,
                      color: Colors.white,
                    ),
                    SizedBox(width: 16,),
                    Text('قبول الحجز تلقائيا')
                  ],
                ),
                SizedBox(height: 60,),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                        width: 270,
                        child: CustomButton(label: 'حفظ',)),
                    SizedBox(width: 20,),
                    CustomCloseButton()
                  ],
                ),
                SizedBox(height: 40,)
              ],
            ),
          ),
        )
    );
  }
}
