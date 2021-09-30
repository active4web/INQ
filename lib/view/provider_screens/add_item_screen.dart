import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class AddItemScreen extends StatelessWidget {
  const AddItemScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        elevation: 0,
        title: Text('اضف عنصر'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text('اضافة عنصر',style: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),)
                ],
              ),
              SizedBox(height: 30,),
              CustomFormField(label: 'النوع',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الاسم',),
              SizedBox(height: 20,),
              CustomFormField(label: 'السعر',),
              SizedBox(height: 20,),
              CustomFormField(label: 'رقم المخزن',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الصلاحية',),
              SizedBox(height: 30,),
              CustomButton(label: 'حفظ و اضافة عنصر جديد',),
              SizedBox(height: 30,),
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
            ],
          ),
        ),
      ),
    );
  }
}
