import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';

class SalonComplaintsScreen extends StatelessWidget {
  const SalonComplaintsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kLightGreenColor,
        title: Text('الشكاوي'),
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
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(16),
                    decoration: kWhiteBoxDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('اسم العميل:',
                              style: TextStyle(
                                color: kPrimaryColor,

                              ),
                              textDirection: TextDirection.rtl,),
                            SizedBox(width: 30,),
                            Text('محمد حسين',textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('رقم العميل:',
                              style: TextStyle(
                                color: kPrimaryColor,
                              ),
                              textDirection: TextDirection.rtl,),
                            SizedBox(width: 30,),
                            Text('962-23333333369',textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                        Divider(thickness: 0.8,),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('اسم الحلاق:',
                              style: TextStyle(
                                color: kPrimaryColor,

                              ),
                              textDirection: TextDirection.rtl,),
                            SizedBox(width: 30,),
                            Text('سالم السيد',textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('الشكوي:',
                              style: TextStyle(
                                color: kPrimaryColor,

                              ),
                              textDirection: TextDirection.rtl,),
                            SizedBox(width: 30,),
                            Text('الحلاق غير نظيف',textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                      ],
                    )
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: 4
              )
            ],
          ),
        ),
      ),
    );
  }
}
