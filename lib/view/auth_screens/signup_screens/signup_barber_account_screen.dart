import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignupBarberAccountScreen extends StatelessWidget {
  const SignupBarberAccountScreen(
      {Key key,
      this.usrName,
      this.fullName,
      this.phone,
      this.email,
      this.password,
      this.usrType,
      this.otp,
      this.country,
      this.city,
      this.gender})
      : super(key: key);

  final usrName;
  final fullName;
  final phone;
  final email;
  final password;
  final usrType;
  final otp;
  final country;
  final city;
  final gender;

  @override
  Widget build(BuildContext context) {
    XFile file;
    XFile imageFile;
    File usrImage;
    TextEditingController barberNameController = new TextEditingController();
    TextEditingController experienceYearsController =
        new TextEditingController();
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
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          if (imageFile != null) {
            usrImage = File(imageFile.path);
          }
          return SingleChildScrollView(
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
                        label: 'اسم الحلاق / الكوافيرة',
                        controller: barberNameController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormField(
                        label: 'عدد سنوات الخبرة',
                        controller: experienceYearsController,
                        inputType: TextInputType.number,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StatefulBuilder(
                        builder: (context, setState) => CustomImagePicker(
                          text: ' رفع صورة الكوافير',
                          onTab: () {
                            cubit.pickImage(file).then((value) {
                              setState(() {
                                imageFile = value;
                              });
                            });
                          },
                          imageFile: imageFile,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                          GestureDetector(
                            onTap: () {
                              cubit.pickFile();
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                'رفع الملف',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          )
                        ],
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
          );
        },
      ),
    );
  }
}
