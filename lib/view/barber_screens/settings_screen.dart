import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

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
                SizedBox(height: 40,),
                Label(text: 'بيانات الحلاق',),
                SizedBox(height: 20,),
                CustomFormField(label: 'اسم الحلاق / الكوافيرة',),
                SizedBox(height: 20,),
                CustomFormField(label: 'الجنس',),
                SizedBox(height: 20,),
                CustomFormField(label: 'عدد سنوات الخبرة',),
                SizedBox(height: 30,),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kGreyColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CustomIcons.photo_camera,color: kPrimaryColor,),
                      SizedBox(height: 10,),
                      Text('رفع صورة الحلاق /الكوافيرة',style: TextStyle(
                        color: kPrimaryColor
                      ),)
                    ],
                  ) ,
                ),
                SizedBox(height: 20,),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'ارفع السيرة الذاتية للحلاق/ كوافيرة',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                            'رفع الملف',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                CustomButton(label: 'تغير كلمة المرور',),
                SizedBox(
                  height: 20,
                ),
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
