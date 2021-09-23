import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_search_bar.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';
import 'package:work/view/notifications_screen.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80,),
            ///custom header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('Assets/images/avatar.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        SizedBox(width: 16,),
                        Text('مرحبا محمد أحمد',
                          style: TextStyle(fontSize: 24,
                              color: kDarkBlueColor),),
                        Expanded(child: SizedBox(),),
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context,
                                    NotificationsScreen.id);
                              },
                              child: Icon(
                                Icons.notifications_none_rounded,
                                color: kLightGreenColor,
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 2,
                              right: 3,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        SizedBox(width: 60,),
                        Text('شارع الثروة,عمان,الأردن',
                        style: TextStyle(
                          color: kDarkBlueColor,
                          fontSize: 14
                        ),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: kBoxDecoration,
                          child: Icon(Icons.filter_list_rounded,
                          color: kGreyColor,),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: CustomSearchBar(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
            ///body
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color(0xffF8F8F8),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text('حدد خدمتك',style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),textDirection: TextDirection.rtl,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ///services list
                  SizedBox(
                    height: 71,
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ServiceTile(
                          icon: CustomIcons.salon,
                          label: 'صالون',
                        ),
                        SizedBox(width: 16,),
                        ServiceTile(
                          icon: CustomIcons.beutycenter,
                          label: 'بيوتي سنتر',
                        ),
                        SizedBox(width: 16,),
                        ServiceTile(
                          icon: CustomIcons.massage,
                          label: 'مساج',
                        ),
                        SizedBox(width: 16,),
                        ServiceTile(
                          icon: CustomIcons.sauna,
                          label: 'حمام تركي',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  ///Discount list
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => DiscountCard(),
                        separatorBuilder: (context, index) => SizedBox(width: 32,),
                        itemCount: 4
                    ),
                  ),
                  SizedBox(height: 30,),
                  ///scan button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomButton(label: 'مزامنة باستخدام QR code ',),
                  ),
                  SizedBox(height: 30,),
                  ///salons cards
                  ListView.separated(
                    padding: EdgeInsets.zero,
                     scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => SalonCard(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 16,
                      ),
                      itemCount: 5
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SalonCard extends StatelessWidget {
  const SalonCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(12),
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 1
        )]
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          SizedBox(width: 16,),
          Container(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('صالون احلي طلة',style: TextStyle(
                      fontSize: 20
                    ),
                    textDirection: TextDirection.rtl,),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    RatingBar.builder(
                      initialRating: 3,
                      textDirection: TextDirection.rtl,
                      minRating: 1,
                      itemSize: 12,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),

                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('شارع الثورة,عمان '),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('الحجوزات : 50',style: TextStyle(
                      color: kPrimaryColor
                    ),
                    textDirection: TextDirection.rtl,
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(child: SizedBox()),
          Column(
            children: [
              Icon(Icons.favorite,color: kPrimaryColor,)
            ],
          )
        ],
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      height: 158,
      width: 246,
     decoration: BoxDecoration(
       color: Color(0xffCDEFD3),
       borderRadius: BorderRadius.circular(30)
     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('صالون زهرة دمشق',
          style: TextStyle(
            color: kDarkBlueColor,
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
          Text('احصل علي قصة شعر مع صبغة',
          style: TextStyle(
          ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            textDirection: TextDirection.rtl,
            children: [
              Text('فقط ب'),
              Text('150',style: TextStyle(
                  color: kPrimaryColor,
                fontWeight: FontWeight.bold
              ),),
              Text('دينار')
            ],
          ),
          SizedBox(),
          Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text('احصل علي العرض',style: TextStyle(
                color: Colors.white,
                fontSize: 11
              ),
                textDirection: TextDirection.rtl,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  const ServiceTile({
    Key key, this.icon, this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
          color: Colors.grey,
          blurRadius: 1
        )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
            color: kPrimaryColor,
          size: 35,),
          Text(label,style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black
          ),)
        ],
      ),
    );
  }
}


