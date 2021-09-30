import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/provider_screens/add_subscriber_screen.dart';

class ProviderSubscribersScreen extends StatelessWidget {
  const ProviderSubscribersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الاشتراكات'),
        backgroundColor: kLightGreenColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              CustomButton(label: 'اضافة اشتراك جديد',
              onTab: (){
                navigateTo(context, AddSubscriberScreen());
              },),
              SizedBox(height: 20,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: kWhiteBoxDecoration.copyWith(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text('المتجر',
                                style: TextStyle(
                                  color: kPrimaryColor,

                                ),
                                textDirection: TextDirection.rtl,),
                              SizedBox(width: 30,),
                              Text('متجر  ${index+1}',textDirection: TextDirection.rtl,
                                )
                            ],
                          ),
                          Divider(),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text('المنتج',
                                style: TextStyle(
                                  color: kPrimaryColor,

                                ),
                                textDirection: TextDirection.rtl,),
                              SizedBox(width: 42,),
                              Text('الفترة',
                                style: TextStyle(
                                  color: kPrimaryColor,

                                ),
                                textDirection: TextDirection.rtl,),
                              SizedBox(width: 42,),
                              Text('الكمية',
                                style: TextStyle(
                                  color: kPrimaryColor,

                                ),
                                textDirection: TextDirection.rtl,),
                              SizedBox(width: 42,),
                              Text('السعر',
                                style: TextStyle(
                                  color: kPrimaryColor,

                                ),
                                textDirection: TextDirection.rtl,),
                            ],
                          ),
                          SizedBox(height: 5,),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            itemBuilder: (context, index) => Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Text('صبغة',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,),
                                SizedBox(width: 42,),
                                Text('اسبوعي',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,),
                                SizedBox(width: 42,),
                                Text('30',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,),
                                SizedBox(width: 42,),
                                Text('500 دينار',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,),
                              ],
                            ),)
                        ],
                      )
                  ),
                  separatorBuilder:(context, index) => SizedBox(height: 20,),
                  itemCount: 10
              ),
            ],
          ),
        ),
      ),
    );
  }
}
