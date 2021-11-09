import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/salon_screens/salon_add_offer.dart';

class SalonOffersScreen extends StatelessWidget {
  const SalonOffersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kLightGreenColor,
        title: Text('العروض'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CustomButton(
                label: 'اضافة عرض جديد',
                onTab: () {
                  navigateTo((context), SalonAddOfferScreen());
                },
              ),
              SizedBox(
                height: 20,
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
                          Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'السعر',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                                textDirection: TextDirection.rtl,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                '300 دينار',
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
                          SizedBox(
                            height: 5,
                          ),
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
                          Divider(),
                          Row(
                            textDirection: TextDirection.rtl,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  showCustomBottomSheet(
                                      context: context,
                                      content: RepeatOfferSheet());
                                },
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(
                                      CupertinoIcons.repeat,
                                      color: kPrimaryColor,
                                      size: 18,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'تكرار',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(color: kDarkBlueColor),
                                    )
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showCustomBottomSheet(
                                      context: context,
                                      content: Column(
                                        children: [
                                          Text(
                                            'تعديل العرض',
                                            style: TextStyle(
                                                color: kDarkBlueColor,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                            textDirection: TextDirection.rtl,
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          CustomFormField(
                                            label: 'العرض',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomFormField(
                                            label: 'المدة',
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomFormField(
                                            label: 'السعر',
                                          ),
                                          SizedBox(
                                            height: 70,
                                          ),
                                          Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              SizedBox(
                                                  width: 270,
                                                  child: CustomButton(
                                                    label: 'حفظ',
                                                  )),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              CustomCloseButton()
                                            ],
                                          ),
                                        ],
                                      ));
                                },
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.edit,
                                      size: 18,
                                      color: Colors.orangeAccent,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'تعديل',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(color: kDarkBlueColor),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.redAccent,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'حذف',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: kDarkBlueColor),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      )),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: 10),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RepeatOfferSheet extends StatelessWidget {
  const RepeatOfferSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OfferTime offerTime = OfferTime.Monthly;
    return StatefulBuilder(
      builder: (context, setState) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'اعادة العرض',
            style: TextStyle(
                color: kDarkBlueColor,
                fontSize: 17,
                fontWeight: FontWeight.bold),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Radio<OfferTime>(
                value: OfferTime.Monthly,
                groupValue: offerTime,
                onChanged: (OfferTime value) {
                  setState(() {
                    offerTime = value;
                  });
                },
              ),
              SizedBox(
                width: 16,
              ),
              Text('شهري'),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Radio<OfferTime>(
                value: OfferTime.Weekly,
                groupValue: offerTime,
                onChanged: (OfferTime value) {
                  setState(() {
                    offerTime = value;
                  });
                },
              ),
              SizedBox(
                width: 16,
              ),
              Text('أسبوعي'),
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Radio<OfferTime>(
                value: OfferTime.Daily,
                groupValue: offerTime,
                onChanged: (OfferTime value) {
                  setState(() {
                    offerTime = value;
                  });
                },
              ),
              SizedBox(
                width: 16,
              ),
              Text('يومي'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SizedBox(
                  width: 270,
                  child: CustomButton(
                    label: 'حفظ',
                  )),
              SizedBox(
                width: 20,
              ),
              CustomCloseButton()
            ],
          ),
        ],
      ),
    );
  }
}
