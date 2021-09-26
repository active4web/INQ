import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';

class UserReservationScreen extends StatefulWidget {
  const UserReservationScreen({Key key}) : super(key: key);

  @override
  _UserReservationScreenState createState() => _UserReservationScreenState();

}


class _UserReservationScreenState extends State<UserReservationScreen> with SingleTickerProviderStateMixin{

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
      // appBar: AppBar(
      //   backgroundColor: kLightGreenColor,
      //   title: Text('الحجوزات'),
      //   elevation: 0,
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.25,),
      //     child: Column(
      //       children: [
      //         Container(
      //           height: MediaQuery.of(context).size.height*0.2,
      //           color: kLightGreenColor,
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 40),
      //             child: Row(
      //               textDirection: TextDirection.rtl,
      //               children: [
      //                 Container(
      //                   width: 60,
      //                   height: 60,
      //                   decoration: BoxDecoration(
      //                       color: Colors.white,
      //                       borderRadius: BorderRadius.circular(10)
      //                   ),
      //                 ),
      //                 SizedBox(width: 30,),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   textDirection: TextDirection.rtl,
      //                   children: [
      //                     Text('محمد أحمد',style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 20
      //                     ),),
      //                     Text('mohamed@gmail.com',
      //                       style: TextStyle(color: Colors.white),),
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: MediaQuery.of(context).size.height*0.08,
      //           color: Colors.white,
      //           child: TabBar(
      //             controller: _tabController,
      //             isScrollable: false,
      //             labelColor: kPrimaryColor,
      //             unselectedLabelColor: Colors.grey,
      //             tabs: [
      //               Text('حجوزات سابقة'),
      //               Text('حجوزات قيد التقدم'),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (context, bool)=>
        [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            backgroundColor: kLightGreenColor,
            leading: Container(),
            title: Text('الحجوزات'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight( MediaQuery.of(context).size.height*0.25,),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    color: kLightGreenColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          SizedBox(width: 30,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text('محمد أحمد',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),),
                              Text('mohamed@gmail.com',
                                style: TextStyle(color: Colors.white),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      labelColor: kPrimaryColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Text('حجوزات سابقة'),
                        Text('حجوزات قيد الانتظار'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          SizedBox(
                            height: 50,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                horizontal: 20),
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(flex: 2,
                                      child: Container(
                                        decoration: kWhiteBoxDecoration.copyWith(
                                          borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: Center(child: Text('رقم الحجز')),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(flex: 2,
                                      child: Container(
                                        decoration: kWhiteBoxDecoration.copyWith(
                                            borderRadius: BorderRadius.circular(16)
                                        ),
                                        child: Center(child: Text('التاريخ')),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: kPrimaryColor,
                                      ),
                                      child: Center(
                                        child: Icon(Icons.search,
                                          color: Colors.white,),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          SizedBox(height: 30,),
                          ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ReservationCard(isDone: true,),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20,
                              ),
                              itemCount: 3
                          ),
                          SizedBox(height: 40,)
                        ],
                      )
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ReservationCard(),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                            itemCount: 3
                        ),
                        SizedBox(height: 40,)
                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard({
    Key key, this.isDone=false,
  }) : super(key: key);
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 16,),
      height: MediaQuery.of(context).size.height*0.35,
      decoration: kWhiteBoxDecoration,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: kLightGreenColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text('صالون أحلي طلة',style: TextStyle(
                          color: kDarkBlueColor
                        ),textDirection: TextDirection.rtl,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text('شارع الثورة,عمان',style: TextStyle(
                          color: kGreyColor,
                          fontSize: 12
                        ),textDirection: TextDirection.rtl,),
                      ],
                    )
                  ],
                ),
                Spacer(),
                if(isDone)Text('طلب مرفوض',style: TextStyle(
                    color: Colors.red
                ),textDirection: TextDirection.rtl,)
              ],
            ),
          ),
          Divider(),
          Expanded(
            flex: 3,
            child: Container(
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
            )
          ),
          Divider(),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text('الاجمالي',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 20
                ),),
                Text('500 دينار',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17
                  ),)

              ],
            )
          ),
        ],
      ),
    );
  }
}
