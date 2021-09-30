import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class AccountStatementScreen extends StatelessWidget {
  const AccountStatementScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('كشف حساب'),
        backgroundColor: kLightGreenColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.grey.shade300,
                      spreadRadius: 1,blurRadius: 1)]
                    ),
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'من',
                          hintTextDirection: TextDirection.rtl
                      ),
                      readOnly: false,
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 46,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.grey.shade300,
                            spreadRadius: 1,blurRadius: 1)]
                    ),
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'الي',
                          hintTextDirection: TextDirection.rtl
                      ),
                      readOnly: false,
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 20,),
              CustomButton(label: "ايجاد",),
              SizedBox(height: 40,),
              ListView.separated(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  height: 46,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.grey.shade300,
                          spreadRadius: 0.6,blurRadius: 0.5)]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${index+10}-12-2020',textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16
                        ),),
                      Text('300 دينار',textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 16,

                        ),)
                    ],
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 10,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
