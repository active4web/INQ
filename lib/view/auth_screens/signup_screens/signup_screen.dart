import 'package:flutter/material.dart';
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
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kDarkBlueColor,
          ),
        ),
        title:Text('تسجيل مشترك جديد', style:TextStyle(
            color: kDarkBlueColor
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Container(
            //   color: Colors.white,
            //   height: 80,
            //   child: Column(
            //     children: [
            //       Directionality(
            //         textDirection: TextDirection.rtl,
            //         child:
            //         NumberStepper(
            //           numbers: [1,2,3],
            //           numberStyle: TextStyle(color: Colors.transparent),
            //           stepColor: Color(0xffC5CEE0),
            //           lineColor: Color(0xffC5CEE0),
            //           lineLength: 120,
            //           direction: Axis.horizontal,
            //           stepRadius: 10,
            //           enableNextPreviousButtons: false,
            //         ),
            //       ),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 16),
            //         child: Row(
            //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           textDirection: TextDirection.rtl,
            //           children: [
            //             Text('معلومات الحساب',textDirection: TextDirection.rtl,),
            //             SizedBox(width: 50,),
            //             Text('نوع الحساب',textDirection: TextDirection.rtl,),
            //             SizedBox(width: 80,),
            //             Text('انهاء',textDirection: TextDirection.rtl,)
            //           ],
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(height: 30,),
            Label(text: 'معلومات الحساب',),
            SizedBox(height: 30,),
            CustomFormField(label: 'اسم المستخدم',),
            SizedBox(height: 20,),
            CustomFormField(label: 'رقم الجوال',),
            SizedBox(height: 20,),
            CustomFormField(label: 'البريد الالكتروني',),
            SizedBox(height: 20,),
            CustomFormField(label: 'كلمة المرور',),
            SizedBox(height: 20,),
            CustomFormField(label: 'تاكيد كلمة المرور',),
            SizedBox(height: 30,),
            Row(textDirection: TextDirection.rtl,
            children: [
               Checkbox(
                value: isAccepted,
                 checkColor: Colors.white,
                 fillColor: MaterialStateProperty.resolveWith(getColor),
                onChanged: (bool value){
                  setState(() {
                    isAccepted = value;
                    print(value);
                    print(isAccepted);
                  });
                },
              ),
              Text('اقبل الشروط والاكام',textDirection: TextDirection.rtl,
              style: TextStyle(color: kPrimaryColor),)
            ],),
            SizedBox(height: 40,),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                    width: 270,
                    child: CustomButton(label: 'التالي',
                    onTab: (){
                      navigateTo(context, PhoneValidationScreen());
                    },)),
                SizedBox(width: 20,),
                CustomCloseButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
