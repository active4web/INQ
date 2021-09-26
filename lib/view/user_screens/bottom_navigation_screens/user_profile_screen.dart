import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        title: Text('الملف الشخصي'),
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
              SizedBox(height: 20,),
              Label(text: 'بيانات المستخدم',),
              SizedBox(height: 20,),
              CustomFormField(label: 'محمد احمد',),
              SizedBox(height: 16,),
              CustomFormField(label: 'ذكر',),
              SizedBox(height: 16,),
              CustomFormField(label: 'mohamed@gmail.com',),
              SizedBox(height: 16,),
              CustomFormField(label: 'عدن',),
              SizedBox(height: 16,),
              CustomFormField(label: 'الأردن',),
              SizedBox(height: 20,),
              Container(
                height: 114,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kGreyColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 40,),
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
      ),
    );
  }
}



class Label extends StatelessWidget {
  const Label({
    Key key, this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Text(text,style: TextStyle(
          fontSize: 20,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600
        ),
        textDirection: TextDirection.rtl,)
      ],
    );
  }
}
