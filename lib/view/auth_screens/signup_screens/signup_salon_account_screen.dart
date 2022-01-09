import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/components/custom_location_picker.dart';
import 'package:work/shared/components/description_text_field.dart';
import 'package:work/shared/components/map_widget.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/auth_screens/login_screens/login_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_account_type_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignUpSalonAccountScreen extends StatefulWidget {
  const SignUpSalonAccountScreen(
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
  State<SignUpSalonAccountScreen> createState() =>
      _SignUpSalonAccountScreenState();
}

class _SignUpSalonAccountScreenState extends State<SignUpSalonAccountScreen> {
  Completer<GoogleMapController> _controller = Completer();

  TextEditingController salonNameController = new TextEditingController();
  TextEditingController ownerNameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  XFile file1;
  XFile file2;
  XFile imageFile1;
  XFile imageFile2;
  File licenseImage;
  File salonImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        if (state is InsertSalonSuccessState) {
          isLoading = false;
          showAlertDialogWithAction(
              imagePath: 'Assets/images/success.png',
              context: context,
              message: 'تم انشاء الحساب بنجاح',
              buttonText: 'شكرًا',
              action: () {
                navigateAndFinish(context, LoginScreen());
              });
        } else if (state is InsertSalonErrorState) {
          isLoading = false;
          showToast(text: 'فشل انشاء حساب', color: Colors.red);
        } else if (state is SignupErrorState) {
          isLoading = false;
          showToast(
              color: Colors.red,
              text: cubit.signUpFailModel.data.errorLookup.scEnDesc);
        }
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        if (imageFile1 != null) {
          licenseImage = File(imageFile1.path);
        }
        if (imageFile2 != null) {
          salonImage = File(imageFile2.path);
        }
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
                        text: 'بيانات الصالون',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomFormField(
                        controller: salonNameController,
                        label: 'اسم الصالون',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomFormField(
                        controller: ownerNameController,
                        label: 'اسم المالك',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      DescriptionTextField(
                        controller: descriptionController,
                        hintText: 'عن الصالون',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomImagePicker(
                        onTab: () {
                          cubit.pickImage(file1).then((value) {
                            setState(() {
                              imageFile1 = value;
                            });
                          });
                        },
                        imageFile: imageFile1,
                        text: 'رفع الرخصة المهنية',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomImagePicker(
                        onTab: () {
                          cubit.pickImage(file2).then((value) {
                            setState(() {
                              imageFile2 = value;
                            });
                          });
                        },
                        imageFile: imageFile2,
                        text: 'رفع صورة الصالون',
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
                LocationPickerScreen(),
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
                        child: isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              )
                            : CustomButton(
                                label: 'انشاء حساب',
                                onTab: () {
                                  isLoading = true;
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
                                      usrImage: salonImage);
                                  cubit.insertSalon(
                                    email: widget.email,
                                    phone: widget.phone,
                                    aboutSalon: descriptionController.text,
                                    city: widget.city,
                                    country: widget.country,
                                    gender: widget.gender,
                                    salonUserName: widget.usrName,
                                    salonName: salonNameController.text,
                                    ownerName: ownerNameController.text,
                                    licenceImage: licenseImage,
                                    salonImage: salonImage,
                                  );
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
          ),
        );
      },
    );
  }
}
