import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/components/map_widget.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignupUserAccountScreen extends StatefulWidget {
  const SignupUserAccountScreen({Key key}) : super(key: key);

  @override
  State<SignupUserAccountScreen> createState() => _SignupUserAccountScreenState();
}

class _SignupUserAccountScreenState extends State<SignupUserAccountScreen>
    with AutomaticKeepAliveClientMixin {

  Completer<GoogleMapController> _controller = Completer();

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
                    text: 'بيانات العميل',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomDropdownField(
                    hint: 'الدولة',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomDropdownField(
                    hint: 'المدينة',
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
                  CustomImagePicker(
                    text: ' رفع صورة المستخدم',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        'حدد الموقع على الخريطة',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            MapWidget(controller: _controller),
            SizedBox(
              height: 20,
            ),
            Text(
              'يدعم التطبيق فروع أخرى بعد التسجيل',
              textDirection: TextDirection.rtl,
              style: TextStyle(color: kPrimaryColor, fontSize: 15),
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

  @override
  bool get wantKeepAlive => true;
}