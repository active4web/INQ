import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/add_service_screen.dart';

class SalonServicesScreen extends StatelessWidget {
  const SalonServicesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('الخدمات'),
        backgroundColor: kLightGreenColor,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 30,),
                CustomFormField(label: 'عدد المقاعد بالصالون',),
                SizedBox(height: 20,),
                CustomButton(label: 'اضافة خدمة',
                  onTab: (){
                    navigateTo(context, AddServiceScreen());
                  },),
                SizedBox(height: 20,),
                ListView.separated(
                  itemCount: 5,
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
                    height: 130,
                    child: Column(
                      children: [
                        Expanded(flex: 5,
                          child:Column(
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'الخدمة',
                                    style: TextStyle(
                                        color: kPrimaryColor
                                    ),
                                    textDirection: TextDirection.rtl,),
                                  Text(
                                    'الوقت',
                                    style: TextStyle(
                                        color: kPrimaryColor
                                    ),
                                    textDirection: TextDirection.rtl,),
                                  Text(
                                    'السعرس',
                                    style: TextStyle(
                                        color: kPrimaryColor
                                    ),
                                    textDirection: TextDirection.rtl,),
                                ],
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'قص شعر',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                    textDirection: TextDirection.rtl,),
                                  Text(
                                    '12 min',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                  Text(
                                    '30 دينار',
                                    style: TextStyle(
                                        color: Colors.grey
                                    ),
                                    textDirection: TextDirection.rtl,),
                                ],
                              ),
                            ],
                          ),),
                        Divider(),
                        Expanded(flex: 2,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){
                                    showCustomBottomSheet(
                                        context: context,
                                        content: Column(
                                          children: [
                                            Text('تعديل الخدمة',style: TextStyle(
                                                color: kDarkBlueColor,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold
                                            ),
                                              textDirection: TextDirection.rtl,),
                                            SizedBox(height: 30,),
                                            CustomFormField(label: 'قص شعر',),
                                            SizedBox(height: 20,),
                                            CustomFormField(label: 'المدة',),
                                            SizedBox(height: 20,),
                                            CustomFormField(label: 'السعر',),
                                            SizedBox(height: 70,),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                SizedBox(
                                                    width: 270,
                                                    child: CustomButton(label: 'حفظ',)),
                                                SizedBox(width: 20,),
                                                CustomCloseButton()
                                              ],
                                            ),
                                          ],
                                        )
                                    );
                                  },
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(FontAwesomeIcons.edit,
                                        size: 18,
                                        color: Colors.orangeAccent,),
                                      SizedBox(width: 10,),
                                      Text('تعديل',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            color: kDarkBlueColor
                                        ),)
                                    ],
                                  ),
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(Icons.delete_outline_rounded,
                                      color: Colors.redAccent,),
                                    SizedBox(width: 5,),
                                    Text('حذف',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          color: kDarkBlueColor
                                      ),)
                                  ],
                                )
                              ],
                            )
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder:(context, index) => SizedBox(height: 20,),
                ),
                SizedBox(height: 20,)
              ],
            ),
          )
      )
    );
  }
}
