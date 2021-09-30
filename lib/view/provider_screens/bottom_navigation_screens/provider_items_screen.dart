import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/provider_screens/add_item_screen.dart';

class ProviderItemsScreen extends StatelessWidget {
  const ProviderItemsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kLightGreenColor,
        title: Text('العناصر'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              CustomButton(label: 'اضافة عنصر جديد',
              onTab: (){
                navigateTo(context, AddItemScreen());
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
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('العنصر : ',textDirection: TextDirection.rtl,),
                            SizedBox(width: 10,),
                            Text('كريم شعر',textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.grey
                            ),)
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('المخزن : ',textDirection: TextDirection.rtl,),
                            SizedBox(width: 10,),
                            Text('مخزن المنطقة الشمالية',textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Colors.grey
                              ),)
                          ],
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text('الكمية : ',textDirection: TextDirection.rtl,),
                            SizedBox(width: 10,),
                            Text('5',textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  color: Colors.grey
                              ),)
                          ],
                        )
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
