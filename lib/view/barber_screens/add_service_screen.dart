import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        elevation: 0,
        title: Text('اضف خدمة'),
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
                  Text('اضافة خدمة',style: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),)
                ],
              ),
              SizedBox(height: 30,),
              CustomFormField(label: 'اسم الخدمة',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الوقت المستغرق',),
              SizedBox(height: 20,),
              CustomFormField(label: 'السعر',),
              SizedBox(height: 30,),
              CustomButton(label: 'حفظ و اضافة خدمة جديدة',),
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
