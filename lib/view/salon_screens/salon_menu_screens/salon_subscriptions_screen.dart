import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';

class SalonSubscriptionsScreen extends StatelessWidget {
  const SalonSubscriptionsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        title: Text('لاشتراكات'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context, index) => Container(
                    padding: EdgeInsets.all(16),
                    decoration: kWhiteBoxDecoration.copyWith(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('الرقم : ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                              textDirection: TextDirection.rtl,),
                            SizedBox(width: 20,),
                            Text('${index+1}',textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('الخدمة : ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                              textDirection: TextDirection.rtl,),
                            SizedBox(width: 10,),
                            Text('لحية',textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                        Divider(thickness: 0.5,),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('الفترة ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                              textDirection: TextDirection.rtl,),
                            Text('عدد الزيارات ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                              textDirection: TextDirection.rtl,),
                            Text('السعر ',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                              textDirection: TextDirection.rtl,),
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('شهريا ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textDirection: TextDirection.rtl,),
                            Text('4 ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textDirection: TextDirection.rtl,),
                            Text('30 دينار ',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              textDirection: TextDirection.rtl,),
                          ],
                        )
                      ],
                    ),
                  ),
                  separatorBuilder:(context, index) => SizedBox(height: 20,),
                  itemCount: 4
              )
            ],
          ),
        ),
      ),
    );
  }
}
