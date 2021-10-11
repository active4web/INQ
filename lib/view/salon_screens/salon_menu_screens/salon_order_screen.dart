import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SalonOrderScreen extends StatelessWidget {
  const SalonOrderScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        elevation: 0,
        title: Text('طلبية جديدة'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Label(text:'الخامات المطلوبة'),
              SizedBox(height: 20,),
              CustomFormField(label: 'حدد الخامة',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الفرع',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الكمية',),
              SizedBox(height: 20,),
              CustomFormField(label: 'موعد الاستلام',),
              SizedBox(height: 20,),
              CustomFormField(label: 'طريقة الدفع',),
              SizedBox(height: 20,),
              CustomFormField(label: 'حدد المورد',),
              SizedBox(height: 50,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                      width: 270,
                      child: CustomButton(label: 'ارسل الطلب',)),
                  SizedBox(width: 20,),
                  CustomCloseButton()
                ],
              ),
              SizedBox(height: 30,)

            ],
          ),
        ),
      ),
    );
  }
}
