import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/auth_screens/signup_screens/signup_account_type_screen.dart';

class PhoneValidationScreen extends StatefulWidget {
  const PhoneValidationScreen(
      {Key key,
      this.usrName,
      this.fullName,
      this.phone,
      this.email,
      this.password,
      this.country,
      this.city,
      this.gender})
      : super(key: key);

  final usrName;
  final fullName;
  final phone;
  final email;
  final password;
  final country;
  final city;
  final gender;

  @override
  _PhoneValidationScreenState createState() => _PhoneValidationScreenState();
}

class _PhoneValidationScreenState extends State<PhoneValidationScreen> {
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;
  String currentText;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
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
        title: Text(
          'تسجيل مشترك جديد',
          style: TextStyle(color: kDarkBlueColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'تحقق من رقم هاتفك',
                style: TextStyle(color: kPrimaryColor, fontSize: 21),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  'تم إرسال رمز مكون من 4أرقام إلى ${widget.phone}',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      selectedColor: Colors.grey,
                      activeColor: Colors.grey,
                      inactiveColor: Colors.grey,
                      borderWidth: 0,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      inactiveFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white
                      //activeFillColor: Colors.white,
                      ),
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  animationDuration: Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  boxShadows: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 0.5, blurRadius: 2)
                  ],
                  errorAnimationController: errorController,
                  controller: otpController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لم تتلقى رمز التفعيل؟ ',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          ' إعادة إرسال',
                          textDirection: TextDirection.rtl,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) {
                  if (state is CheckOtpSuccessState) {
                    navigateTo(
                        context,
                        SignUpAccountTypeScreen(
                          usrName: widget.usrName,
                          phone: widget.phone,
                          password: widget.password,
                          fullName: widget.fullName,
                          email: widget.email,
                          otp: otpController.text,
                          country: widget.country,
                          city: widget.city,
                          gender: widget.gender,
                        ));
                  } else if (state is CheckOtpErrorState) {
                    showToast(text: "رمز التأكيد خطأ", color: Colors.red);
                  }
                },
                builder: (context, state) {
                  AuthCubit cubit = AuthCubit.get(context);
                  return Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 270,
                          child: state is CheckOtpLoadingState
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ))
                              : CustomButton(
                                  label: 'تحقق',
                                  onTab: () {
                                    cubit.checkOtp(
                                        otpValue: otpController.text,
                                        phone: widget.phone,
                                        usrName: widget.usrName);
                                  },
                                )),
                      SizedBox(
                        width: 20,
                      ),
                      CustomCloseButton()
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
