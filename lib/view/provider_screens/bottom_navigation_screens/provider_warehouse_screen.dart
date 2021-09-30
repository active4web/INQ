import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/provider_screens/add_warehouse_screen.dart';

class ProviderWarehouseScreen extends StatelessWidget {
  const ProviderWarehouseScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('المخازن'),
        backgroundColor: kLightGreenColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              CustomButton(label: 'اضافة مخزن جديد',
              onTab: (){
                navigateTo(context, AddWarehouseScreen());
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
                    height: 130,
                    child: Column(
                      children: [
                        Expanded(flex: 5,
                          child:Column(
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text('رقم المخزن : ',
                                  textDirection: TextDirection.rtl,),
                                  Text('1',style: TextStyle(
                                    color: Colors.grey
                                  ),textDirection: TextDirection.rtl,
                                  softWrap: true,)
                                ],
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text('اسم المخزن : ',
                                    textDirection: TextDirection.rtl,),
                                  SizedBox(width: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.5,
                                    child: Text('مخزن المنطقة الشمالية',
                                    textDirection: TextDirection.rtl,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),softWrap: true,))
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
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Icon(FontAwesomeIcons.edit,
                                  size: 18,
                                  color: Colors.orange,),
                                  SizedBox(width: 10,),
                                  Text('تعديل',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: kDarkBlueColor
                                  ),)
                                ],
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Icon(Icons.location_on_outlined,
                                    color: kGreyColor,),
                                  SizedBox(width: 10,),
                                  Text('شاهد الخريطة',
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
                  itemCount: 10
              ),
            ],
          ),
        ),
      ),
    );
  }
}
