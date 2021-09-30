import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';

class BarberOffersScreen extends StatelessWidget {
  const BarberOffersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('العروض'),
        backgroundColor: kLightGreenColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
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
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'العرض',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'قص شعر + سيشوار',
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'من',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'June 15,2020',
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'الي',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                'June 15,2020',
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
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
