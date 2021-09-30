import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/constants.dart';

class ProviderOrdersScreen extends StatelessWidget {
  const ProviderOrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kLightGreenColor,
        title: Text('الطلبات'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 46,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: kWhiteBoxDecoration.copyWith(
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                            child: Text(
                          'رقم الطلب',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.grey),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: kWhiteBoxDecoration.copyWith(
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            'التاريخ',
                            style: TextStyle(color: Colors.grey),
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                label: 'بحث',
              ),
              SizedBox(
                height: 30,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: kWhiteBoxDecoration.copyWith(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Text(
                                        'رقم الطلب',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '133',
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Color(0xfff8f8f8),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Center(
                                          child: Text(
                                        'تم',
                                        style: TextStyle(color: kPrimaryColor),
                                        textDirection: TextDirection.rtl,
                                      )),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    'المتجر',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'متجر  ${index + 1}',
                                    textDirection: TextDirection.rtl,
                                  )
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'المنتج',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 42,
                              ),
                              Text(
                                'الفترة',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 42,
                              ),
                              Text(
                                'الكمية',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 42,
                              ),
                              Text(
                                'السعر',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 2,
                            itemBuilder: (context, index) => Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Text(
                                  'صبغة',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(
                                  width: 42,
                                ),
                                Text(
                                  'اسبوعي',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(
                                  width: 42,
                                ),
                                Text(
                                  '30',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                                SizedBox(
                                  width: 42,
                                ),
                                Text(
                                  '500 دينار',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: 10),
            ],
          ),
        ),
      ),
    );
  }
}
