import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/models/service_model.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/components/custom_location_picker.dart';
import 'package:work/shared/components/map_widget.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/shared/get_sys_codes.dart';
import 'package:work/view/auth_screens/login_screens/login_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignupUserAccountScreen extends StatefulWidget {
  const SignupUserAccountScreen(
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
  State<SignupUserAccountScreen> createState() =>
      _SignupUserAccountScreenState();
}

class _SignupUserAccountScreenState
    extends State<SignupUserAccountScreen> //with AutomaticKeepAliveClientMixin
{
  // @override
  // bool get wantKeepAlive => true;

  Completer<GoogleMapController> _controller = Completer();

  XFile file;
  XFile imageFile;
  File usrImage;

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
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          if (state is SignupSuccessState) {
            showAlertDialogWithAction(
                imagePath: 'Assets/images/success.png',
                context: context,
                message: 'تم انشاء الحساب بنجاح',
                buttonText: 'شكرًا',
                action: () {
                  navigateAndFinish(context, LoginScreen());
                });
          } else if (state is SignupErrorState) {
            showToast(
                color: Colors.red,
                text: cubit.signUpFailModel.data.errorLookup.scEnDesc);
          }
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
                        text: 'بيانات العميل',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomImagePicker(
                        onTab: () {
                          cubit.pickImage(file).then((value) {
                            setState(() {
                              imageFile = value;
                            });
                          });
                        },
                        imageFile: imageFile,
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
                // MapWidget(controller: _controller),
                LocationPickerScreen(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 270,
                        child: state is SignupLoadingState
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              )
                            : CustomButton(
                                label: 'انشاء حساب',
                                onTab: () {
                                  cubit.signUp(
                                    otpValue: widget.otp,
                                    email: widget.email,
                                    countryId: widget.country,
                                    cityId: widget.city,
                                    genderId: widget.gender,
                                    clientFullName: widget.fullName,
                                    mobile: widget.phone,
                                    password: widget.password,
                                    userType: widget.usrType,
                                    userName: widget.usrName,
                                    usrImage: usrImage,
                                  );
                                  print(widget.phone);
                                  print(widget.otp);
                                  print(widget.country);
                                  print(widget.city);
                                  print(widget.gender);
                                  print(widget.password);
                                  print(widget.usrName);
                                  print(widget.usrType);
                                  print(widget.fullName);
                                },
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
