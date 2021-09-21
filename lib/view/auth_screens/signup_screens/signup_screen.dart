import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:work/shared/constants.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);
  static const String id = "signupScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            height: 80,
            child: Column(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                  NumberStepper(
                    numbers: [1,2,3],
                    numberStyle: TextStyle(color: Colors.transparent),
                    stepColor: Color(0xffC5CEE0),
                    lineColor: Color(0xffC5CEE0),
                    lineLength: 120,
                    direction: Axis.horizontal,
                    stepRadius: 10,
                    enableNextPreviousButtons: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text('معلومات الحساب',textDirection: TextDirection.rtl,),
                      SizedBox(width: 50,),
                      Text('نوع الحساب',textDirection: TextDirection.rtl,),
                      SizedBox(width: 80,),
                      Text('انهاء',textDirection: TextDirection.rtl,)
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.65,
                    color: Color(0xffC5CEE0),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
