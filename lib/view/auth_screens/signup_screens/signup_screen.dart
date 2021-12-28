import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/auth_screens/signup_screens/phone_validation_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_account_type_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPassController = new TextEditingController();
  bool isAccepted = false;
  var countryCode;

  // void _onCountryChange(CountryCode countryCode) {
  //   print("New Country selected: " + countryCode.toString());
  // }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return kPrimaryColor;
  }

  @override
  void initState() {
    AuthCubit.get(context).getSysData();
    super.initState();
  }

  int country;
  int city;
  int gender;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              AuthCubit cubit = AuthCubit.get(context);
              return cubit.countries != null ||
                      cubit.cities != null ||
                      cubit.genders != null
                  ? Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Label(
                          text: 'معلومات الحساب',
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomFormField(
                          label: 'الاسم',
                          controller: fullNameController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          label: 'رقم الجوال',
                          controller: phoneController,
                          prefix: CountryCodePicker(
                            padding: EdgeInsets.zero,
                            favorite: ['+20', '+962'],
                            initialSelection: '+962',
                            onChanged: (value) {
                              countryCode = value.dialCode;
                              print(countryCode);
                            },
                            onInit: (value) {
                              countryCode = value.dialCode;
                            },
                          ),
                          inputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomDropdownField(
                          hint: 'الدولة',
                          itemsList: cubit.countries.data.map((e) {
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
                          itemsList: cubit.cities.data.map((e) {
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
                          itemsList: cubit.genders.data.map((e) {
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
                        CustomFormField(
                          label: 'اسم المستخدم',
                          controller: userNameController,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          label: 'البريد الالكتروني',
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          label: 'كلمة المرور',
                          controller: passwordController,
                          isSecured: true,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomFormField(
                          label: 'تاكيد كلمة المرور',
                          controller: confirmPassController,
                          isSecured: true,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Checkbox(
                              value: isAccepted,
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              onChanged: (bool value) {
                                setState(() {
                                  isAccepted = value;
                                  print(value);
                                  print(isAccepted);
                                });
                              },
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'اقبل الشروط والأحكام',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(color: kPrimaryColor),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            SizedBox(
                              width: 270,
                              child: CustomButton(
                                label: 'التالي',
                                onTab: () {
                                  if (userNameController.text == '' ||
                                      fullNameController.text == '' ||
                                      phoneController.text == '' ||
                                      emailController.text == '' ||
                                      passwordController.text == '') {
                                    showToast(
                                        text: 'تأكد من ملئ البيانات بشكل كامل',
                                        color: Colors.red);
                                  } else if (passwordController.text !=
                                      confirmPassController.text) {
                                    showToast(
                                        text: "كلمة المرور غير متوافقة",
                                        color: Colors.red);
                                  } else if (!isAccepted) {
                                    showToast(
                                        text:
                                            'يجب الموافقة علي الشروط و الأحكام',
                                        color: Colors.red);
                                  } else {
                                    navigateTo(
                                        context,
                                        PhoneValidationScreen(
                                          email: emailController.text,
                                          fullName: fullNameController.text,
                                          password: passwordController.text,
                                          phone: countryCode +
                                              phoneController.text,
                                          usrName: userNameController.text,
                                          city: city,
                                          country: country,
                                          gender: gender,
                                        ));
                                    cubit.createOtp(
                                        phone:
                                            countryCode + phoneController.text);
                                  }
                                  print(countryCode + phoneController.text);
                                },
                              ),
                            ),
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
                    );
            },
          ),
        ),
      ),
    );
  }
}
