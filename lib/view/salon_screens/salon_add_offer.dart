import 'package:flutter/material.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class SalonAddOfferScreen extends StatefulWidget {
  const SalonAddOfferScreen({Key key}) : super(key: key);

  @override
  _SalonAddOfferScreenState createState() => _SalonAddOfferScreenState();
}

class _SalonAddOfferScreenState extends State<SalonAddOfferScreen> {
  OfferTime offerTime = OfferTime.Monthly;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        elevation: 0,
        title: Text('اضافة عرض'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text('اضف عرض جديد',style: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,

                  ),textDirection: TextDirection.rtl,)
                ],
              ),
              SizedBox(height: 30,),
              CustomFormField(label: 'العرض',),
              SizedBox(height: 20,),
              CustomFormField(label: 'السعر',),
              SizedBox(height: 20,),
              CustomFormField(label: 'من',),
              SizedBox(height: 20,),
              CustomFormField(label: 'الي',),
              SizedBox(height: 30,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text('اعادة العرض',style: TextStyle(
                      color: kDarkBlueColor,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                    textDirection: TextDirection.rtl,),
                ],
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
                  SizedBox(width: 16,),
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
                  SizedBox(width: 16,),
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
                  SizedBox(width: 16,),
                  Text('يومي'),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                      width: 270,
                      child: CustomButton(label: 'اضافة',)),
                  SizedBox(width: 20,),
                  CustomCloseButton()
                ],
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
