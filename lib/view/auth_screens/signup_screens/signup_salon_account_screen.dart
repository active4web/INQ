import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/components/description_text_field.dart';
import 'package:work/shared/components/map_widget.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
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
      this.otp})
      : super(key: key);

  final usrName;
  final fullName;
  final phone;
  final email;
  final password;
  final usrType;
  final otp;
  @override
  State<SignUpSalonAccountScreen> createState() =>
      _SignUpSalonAccountScreenState();
}

class _SignUpSalonAccountScreenState extends State<SignUpSalonAccountScreen>
    with AutomaticKeepAliveClientMixin {
  Completer<GoogleMapController> _controller = Completer();

  TextEditingController salonNameController = new TextEditingController();
  TextEditingController ownerNameController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
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
                        text: 'رفع الرخصة المهنية',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomImagePicker(
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
                          label: 'التالي',
                          onTab: () {
                            cubit.signUp(
                              otpValue: widget.otp,
                              email: widget.email,
                              // countryId: country,
                              // cityId: city,
                              // genderId: gender,
                              clientFullName: widget.fullName,
                              mobile: widget.phone,
                              password: widget.password,
                              userType: widget.usrType,
                              userName: widget.usrName,
                              // usrImage: usrImage,
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

  @override
  bool get wantKeepAlive => true;
}
