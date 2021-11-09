import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignupBarberAccountScreen extends StatelessWidget {
  const SignupBarberAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kDarkBlueColor,
          ),
        ),
        title: Text(
          'تسجيل مشترك جديد',
          style: TextStyle(color: kDarkBlueColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Label(
                    text: 'بيانات الحلاق',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomFormField(
                    label: 'رقم الهاتف',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    label: 'البريد الالكتروني',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomFormField(
                    label: 'اسم الحلاق / الكوافيرة',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdownField(
                    hint: 'الجنس',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdownField(
                    hint: 'عدد سنوات الخبرة',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomImagePicker(
                    text: ' رفع صورة الكوافير',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 270,
                    child: CustomButton(
                      label: 'انشاء حساب',
                      onTab: () {},
                    )),
                SizedBox(
                  width: 20,
                ),
                CustomCloseButton()
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
