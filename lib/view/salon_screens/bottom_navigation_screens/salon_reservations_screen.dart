import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';
import 'package:work/view/barber_screens/barber_services_screen.dart';

class SalonReservationsScreen extends StatefulWidget {
  const SalonReservationsScreen({Key key}) : super(key: key);

  @override
  _SalonReservationsScreenState createState() => _SalonReservationsScreenState();
}

class _SalonReservationsScreenState extends State<SalonReservationsScreen> with SingleTickerProviderStateMixin{

  var _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2,initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الحجوزات'),
        elevation: 0,
        backgroundColor: kLightGreenColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
              MediaQuery.of(context).size.height*0.1
          ),
          child: Container(
            height: MediaQuery.of(context).size.height*0.09,
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: kPrimaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Text('حجوزات سابقة'),
                Text('حجوزات قيد الانتظار')
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => SalonPreviousReservationCard(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: 3
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => SalonBindingReservationCard(),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: 3
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SalonBindingReservationCard extends StatelessWidget {
  const SalonBindingReservationCard({
    Key key, this.isDone=false,
  }) : super(key: key);
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      //height: MediaQuery.of(context).size.height*0.35,
      decoration: kWhiteBoxDecoration.copyWith(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(CustomIcons.man,
                        color: kPrimaryColor,size: 16,),
                      SizedBox(width: 15,),
                      Text('محمد احمد',style: TextStyle(
                          color: kDarkBlueColor
                      ),textDirection: TextDirection.rtl,),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(Icons.phone_android_rounded,
                      color: kPrimaryColor,size: 16,),
                      SizedBox(width: 15,),
                      Text('01011784118',style: TextStyle(
                      ),textDirection: TextDirection.rtl,),
                    ],
                  )
                ],
              ),
              Spacer(),
              Text('500 دينار',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17
                ),)
            ],
          ),
          Divider(),
          Container(
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('صبغة + ماسكات',
                      textDirection: TextDirection.rtl,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(Icons.person,
                          color: Colors.grey,
                          size: 16,),
                        SizedBox(width: 10,),
                        Text('محمد أحمد',
                          style: TextStyle(
                              color: Colors.grey
                          ),textDirection: TextDirection.rtl,)
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text('1:30 - 2:30 PM',textDirection: TextDirection.rtl,),
                        SizedBox(width: 20,),
                        Text('June 15,2020',textDirection: TextDirection.rtl,)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('موافقة',style: TextStyle(
                      color: Colors.white
                    ),),),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text('رفض',style: TextStyle(
                        color: Colors.white
                    ),),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalonPreviousReservationCard extends StatelessWidget {
  const SalonPreviousReservationCard({
    Key key, this.isDone=false,
  }) : super(key: key);
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      //height: MediaQuery.of(context).size.height*0.35,
      decoration: kWhiteBoxDecoration.copyWith(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(CustomIcons.man,
                        color: kPrimaryColor,size: 16,),
                      SizedBox(width: 15,),
                      Text('محمد احمد',style: TextStyle(
                          color: kDarkBlueColor
                      ),textDirection: TextDirection.rtl,),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(Icons.phone_android_rounded,
                        color: kPrimaryColor,size: 16,),
                      SizedBox(width: 15,),
                      Text('01011784118',style: TextStyle(
                      ),textDirection: TextDirection.rtl,),
                    ],
                  )
                ],
              ),
              Spacer(),
              Text('500 دينار',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 17
                ),)
            ],
          ),
          Divider(),
          Container(
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('صبغة + ماسكات',
                      textDirection: TextDirection.rtl,),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Icon(Icons.person,
                          color: Colors.grey,
                          size: 16,),
                        SizedBox(width: 10,),
                        Text('محمد أحمد',
                          style: TextStyle(
                              color: Colors.grey
                          ),textDirection: TextDirection.rtl,)
                      ],
                    ),
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Text('1:30 - 2:30 PM',textDirection: TextDirection.rtl,),
                        SizedBox(width: 20,),
                        Text('June 15,2020',textDirection: TextDirection.rtl,)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('طلب مرفوض',style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),),
          ),
        ],
      ),
    );
  }
}