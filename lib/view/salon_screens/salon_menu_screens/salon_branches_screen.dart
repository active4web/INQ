import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/salon_screens/salon_add_branch_screen.dart';

class SalonBranchesScreen extends StatelessWidget {
  const SalonBranchesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        elevation: 0,
        title: Text('الفروع'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              CustomButton(label: 'اضافة فرع جديد',
              onTab: (){
                navigateTo(context, AddBranchScreen());
              },),
              SizedBox(height: 20,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context, index) => BranchCard(),
                  separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: 6
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}

class BranchCard extends StatelessWidget {
  const BranchCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: kWhiteBoxDecoration.copyWith(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kLightGreenColor
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('فرع عدن',textDirection: TextDirection.rtl,
              style: TextStyle(
                color: kDarkBlueColor,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              Text('شارع الثورة,عمان',textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey
              ),),
              Text('عدد الحلاقين : 5',textDirection: TextDirection.rtl,
              style: TextStyle(
                color: kPrimaryColor,
              ),)
            ],
          )
        ],
      ),
    );
  }
}
