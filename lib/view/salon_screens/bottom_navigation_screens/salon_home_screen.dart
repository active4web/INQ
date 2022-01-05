import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';

class SalonHomeScreen extends StatefulWidget {
  const SalonHomeScreen({Key key}) : super(key: key);

  @override
  _SalonHomeScreenState createState() => _SalonHomeScreenState();
}

class _SalonHomeScreenState extends State<SalonHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  CalendarController _calenderController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _calenderController = CalendarController();
    SalonCubit.get(context).generateSalonQrCode();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalonCubit, SalonStates>(
      builder: (context, state) {
        SalonCubit cubit = SalonCubit.get(context);
        Uint8List bytes =
            Base64Codec().decode(cubit.mySalonInfo.data[0].stpSalShopPicture);
        return cubit.mySalonInfo == null
            ? Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: kLightGreenColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: MemoryImage(bytes)),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    cubit.mySalonInfo.data[0].stpSalNameAr ??
                                        '',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Text(
                                    cubit.mySalonInfo.data[0]
                                            .stpSalGpsLocation ??
                                        '',
                                    style: TextStyle(color: Colors.white),
                                    textDirection: TextDirection.rtl,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          onTab: () {
                            showCustomBottomSheet(
                                context: context,
                                content: Column(
                                  children: [
                                    Text(
                                      'PLS scan QR code from customer mobile account',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black87),
                                    ),
                                    cubit.salonQrImage == null
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                color: kPrimaryColor,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            margin: EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: MemoryImage(
                                                        cubit.salonQrImage))),
                                          ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        SizedBox(
                                            width: 250,
                                            child: CustomButton(
                                              label: 'تم',
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
                          label: 'احجز باستخدام QR code',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TableCalendar(
                              calendarStyle: CalendarStyle(
                                  highlightToday: true,
                                  selectedColor: kPrimaryColor,
                                  todayColor: kLightGreenColor),
                              initialCalendarFormat: CalendarFormat.week,
                              startDay: DateTime.utc(2010, 10, 16),
                              endDay: DateTime.utc(2030, 3, 14),
                              onDaySelected: (value, lis, list) {
                                setState(() {
                                  var dateTime =
                                      "${value.year}-${value.month}-${value.day}";
                                });
                              },
                              calendarController: _calenderController,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.09,
                          color: Colors.white,
                          child: TabBar(
                            controller: _tabController,
                            labelColor: kPrimaryColor,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Text('حسب الحلاق'),
                              Text('الكل'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TabBarView(
                            dragStartBehavior: DragStartBehavior.start,
                            physics: BouncingScrollPhysics(),
                            controller: _tabController,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      // height: MediaQuery.of(context).size.height*0.2,
                                      decoration: kWhiteBoxDecoration.copyWith(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 16),
                                            child: Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                Text(
                                                  'اختار',
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            height: 120,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                width: 10,
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 6,
                                              itemBuilder: (context, index) =>
                                                  Column(
                                                children: [
                                                  Container(
                                                    width: 75,
                                                    height: 75,
                                                    decoration: BoxDecoration(
                                                        color: kLightGreenColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ),
                                                  Text('محمد ماهر')
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      decoration: kWhiteBoxDecoration.copyWith(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Text(
                                                'جدول الحجوزات',
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Expanded(
                                            child: GridView.count(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 10,
                                              children: [
                                                ///free
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '9:00 - 10:00 AM',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),

                                                ///reserved
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.red,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '7:30 - 8:30 AM',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '9:00 - 10:00 AM',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.red,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '7:30 - 8:30 AM',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.red,
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '7:30 - 8:30 AM',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.grey),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '9:00 - 10:00 AM',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              shrinkWrap: true,
                                              childAspectRatio: 3.5,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            Container(
                                              // height: MediaQuery.of(context)
                                              //     .size.height*0.15,
                                              padding: EdgeInsets.all(16),
                                              decoration:
                                                  kWhiteBoxDecoration.copyWith(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    children: [
                                                      Text(
                                                        'صبغة + ماسكات',
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 18),
                                                        textDirection:
                                                            TextDirection.rtl,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    children: [
                                                      Icon(
                                                        Icons.person,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'تامر احمد',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                        textDirection:
                                                            TextDirection.rtl,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    children: [
                                                      Text('2:30 - 3:30 PM'),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text('June 15,2020')
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                              height: 20,
                                            ),
                                        itemCount: 4),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
