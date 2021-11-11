import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
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
        title: Text('تسجيل مشترك جديد', style: TextStyle(
            color: kDarkBlueColor
        ),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Label(text: 'معلومات الحساب',),
              SizedBox(height: 30,),
              CustomFormField(label: 'الاسم',
                controller: fullNameController,),
              SizedBox(height: 20,),
              CustomFormField(label: 'رقم الجوال',
                controller: phoneController,),
              SizedBox(height: 20,),
              CustomFormField(label: 'اسم المستخدم',
                controller: userNameController,
              ),
              SizedBox(height: 20,),
              CustomFormField(label: 'البريد الالكتروني',
                controller: emailController,),
              SizedBox(height: 20,),
              CustomFormField(label: 'كلمة المرور',
                controller: passwordController,
                isSecured: true,),
              SizedBox(height: 20,),
              CustomFormField(label: 'تاكيد كلمة المرور',
                controller: confirmPassController,
                isSecured: true,),
              SizedBox(height: 30,),
              Row(textDirection: TextDirection.rtl,
                children: [
                  Checkbox(
                    value: isAccepted,
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
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
                      'اقبل الشروط والأحكام', textDirection: TextDirection.rtl,
                      style: TextStyle(color: kPrimaryColor),),
                  )
                ],),
              SizedBox(height: 40,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                      width: 270,
                      child: BlocBuilder<AuthCubit, AuthStates>(
                        builder: (context, state) {
                          AuthCubit cubit = AuthCubit.get(context);
                          return CustomButton(label: 'التالي',
                            onTab: () {
                              if (
                              userNameController.text == '' ||
                                  fullNameController.text == '' ||
                                  phoneController.text == '' ||
                                  emailController.text == '' ||
                                  passwordController.text == ''
                              ) {
                                showToast(
                                    text: 'تأكد من ملئ البيانات بشكل كامل',
                                    color: Colors.red);
                              } else if (passwordController.text !=
                                  confirmPassController.text) {
                                showToast(text: "كلمة المرور غير متوافقة",
                                    color: Colors.red);
                              } else if (!isAccepted) {
                                showToast(
                                    text: 'يجب الموافقة علي الشروط و الأحكام',
                                    color: Colors.red);
                              } else {
                                navigateTo(context, PhoneValidationScreen(
                                  email: emailController.text,
                                  fullName: fullNameController.text,
                                  password: passwordController.text,
                                  phone: phoneController.text,
                                  usrName: userNameController.text,
                                ));
                                cubit.createOtp(phone: phoneController.text);
                              }
                            },);
                        },
                      )),
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
