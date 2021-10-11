import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/constants.dart';

class SalonStatisticsScreen extends StatelessWidget {
  const SalonStatisticsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        title: Text('احصائيات'),
        elevation: 0,
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
                    decoration: kWhiteBoxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 46,
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: Container(
                    decoration: kWhiteBoxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 46,
                  )),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(child: Container(
                    decoration: kWhiteBoxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 46,
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: Container(
                    decoration: kWhiteBoxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 46,
                  )),
                ],
              ),
              SizedBox(height: 30,),
              CustomButton(label: 'بحث',),
              SizedBox(height: 50,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder:(context, index) =>Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text('عدد العملاء في اليوم المحدد'),
                  SizedBox(width: MediaQuery.of(context).size.width*0.3,),
                  Text('7'),
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
