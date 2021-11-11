import 'dart:async';

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
import 'package:work/shared/components/map_widget.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/get_sys_codes.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignupUserAccountScreen extends StatefulWidget {
  const SignupUserAccountScreen(
      {Key key,
      this.usrName,
      this.fullName,
      this.phone,
      this.email,
      this.password,
      this.usrType, this.otp})
      : super(key: key);
  final usrName;
  final fullName;
  final phone;
  final email;
  final password;
  final usrType;
  final otp;

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

  ServiceModel genders;
  ServiceModel countries;
  ServiceModel cities;

  void getData() async {
    genders = await getSysCodes(scType: 2);
    countries = await getSysCodes(scType: 6);
    cities = await getSysCodes(scType: 7);
    print(countries.data[0].scArDesc);
    setState(() {});
  }

  @override
  void initState() {
    this.getData();
    super.initState();
  }

  int country;
  int city;
  int gender;
  XFile file;
  XFile imageFile;

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
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: countries != null || cities != null || genders != null
                ? Column(
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
                              itemsList: countries.data.map((e) {
                                return DropdownMenuItem(
                                  child: Text(
                                    e.scArDesc,
                                  ),
                                  value: e.scCode,
                                  alignment: Alignment.centerRight,
                                );
                              }).toList(),
                              value: country,
                              onChanged: (value) {
                                setState(() {
                                  country = value;
                                  print(country);
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomDropdownField(
                              hint: 'المدينة',
                              itemsList: cities.data.map((e) {
                                return DropdownMenuItem(
                                  child: Text(
                                    e.scArDesc,
                                  ),
                                  value: e.scCode,
                                  alignment: Alignment.centerRight,
                                );
                              }).toList(),
                              value: city,
                              onChanged: (value) {
                                setState(() {
                                  city = value;
                                  print(city);
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomDropdownField(
                              hint: 'الجنس',
                              itemsList: genders.data.map((e) {
                                return DropdownMenuItem(
                                  child: Text(
                                    e.scArDesc,
                                  ),
                                  value: e.scCode,
                                  alignment: Alignment.centerRight,
                                );
                              }).toList(),
                              value: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value;
                                  print(gender);
                                });
                              },
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
                      MapWidget(controller: _controller),
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
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
