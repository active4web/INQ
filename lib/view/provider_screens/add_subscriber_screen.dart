import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class AddSubscriberScreen extends StatelessWidget {
  const AddSubscriberScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافة اشتراك'),
        elevation: 0,
        backgroundColor: kLightGreenColor,
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
                  Text('اضافة اشتراك جديد',style: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),)
                ],
              ),
              SizedBox(height: 30,),
              CustomFormField(label: 'المتجر',),
              SizedBox(height: 20,),
              CustomFormField(label: 'العنصر',),
              SizedBox(height: 20,),
              CustomFormField(label: 'السعر',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الكمية',),
              SizedBox(height: 20,),
              CustomFormField(label: 'رقم المخزن',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الفترة',),
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
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );
  }
}
