import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/user_cubit/user_cubit.dart';
import 'package:work/cubit/user_cubit/user_states.dart';
import 'package:work/models/salon_info_model.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';
import 'package:work/view/auth_screens/login_screens/login_screen.dart';

import 'bottom_navigation_screens/user_home_screen.dart';

class SalonScreen extends StatefulWidget {
  const SalonScreen({Key key, @required this.salonInfo}) : super(key: key);
  final Datum salonInfo;
  @override
  _SalonScreenState createState() => _SalonScreenState();
}

class _SalonScreenState extends State<SalonScreen>
    with SingleTickerProviderStateMixin {
  var _tabController;
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.82);
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4, initialIndex: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserStates>(
        builder: (context, state) {
          UserCubit cubit = UserCubit.get(context);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 220,
                // backgroundColor: Colors.transparent,
                elevation: 0,
                pinned: false,
                floating: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: FlutterLogo(),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Text(
                                      widget.salonInfo.stpSalNameAr,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: kDarkBlueColor),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: cubit.salonRating,
                                      textDirection: TextDirection.rtl,
                                      minRating: 0,
                                      allowHalfRating: true,
                                      itemSize: 12,
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
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
                                    Text(widget.salonInfo.stpSalGpsLocation ??
                                        ''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TabBar(
                            controller: _tabController,
                            labelColor: kPrimaryColor,
                            unselectedLabelColor: Colors.grey,
                            tabs: [
                              Text('?????? ??????????'),
                              Text('???? ??????????????'),
                              Text('??????????????'),
                              Text('?????? ????????'),
                            ],
                          ),
                          LimitedBox(
                            maxHeight: 1200,
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                JopRequestTabScreen(),
                                Container(
                                  color: Color(0xfff8f8f8),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 40, horizontal: 20),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: kWhiteBoxDecoration,
                                        child: Text(
                                          widget.salonInfo
                                                  .stpSalSalonNoteAbout ??
                                              '',
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ServicesTabScreen(
                                    cubit: cubit,
                                    pageController: _pageController),
                                ReservationTabScreen(
                                  cubit: cubit,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

class JopRequestTabScreen extends StatelessWidget {
  const JopRequestTabScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  '???????????? ??????????',
                  style: TextStyle(fontSize: 20, color: kDarkBlueColor),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomFormField(
              label: '?????? ????????????',
            ),
            SizedBox(
              height: 16,
            ),
            CustomFormField(
              label: '?????? ????????????',
            ),
            SizedBox(
              height: 16,
            ),
            CustomFormField(
              label: '???????????? ????????????????????',
            ),
            SizedBox(
              height: 16,
            ),
            CustomFormField(
              label: '??????????',
            ),
            SizedBox(
              height: 16,
            ),
            CustomFormField(
              label: '?????? ?????????? ????????????',
            ),
            SizedBox(
              height: 16,
            ),
            CustomFormField(
              label: '?????????? ??????????',
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  '???????? ???????????? ?????????????? ????????????/ ??????????????',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: kPrimaryColor,
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child: Text(
                    '?????? ??????????',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                    width: 270,
                    child: CustomButton(
                      label: '?????????? ??????????',
                    )),
                SizedBox(
                  width: 20,
                ),
                CustomCloseButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServicesTabScreen extends StatelessWidget {
  const ServicesTabScreen({
    Key key,
    @required PageController pageController,
    this.cubit,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;
  final UserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
              height: 170,
              child: PageView.builder(
                itemCount: 4,
                controller: _pageController,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kLightGreenColor),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 4,
            effect: JumpingDotEffect(
                dotColor: Color(0xff7DDC8D),
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: kPrimaryColor),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  '??????????????',
                  style: TextStyle(
                    color: kDarkBlueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cubit.servicesBySalonModel.data.length,
                  itemBuilder: (context, index) => ServiceRow(
                    name: cubit.servicesBySalonModel.data[index].servicesNameAr,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    childAspectRatio: 3 / 1,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReservationTabScreen extends StatelessWidget {
  const ReservationTabScreen({
    Key key,
    this.cubit,
  }) : super(key: key);
  final UserCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff8f8f8),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: cubit.barbersBySalonModel.data.length,
            itemBuilder: (context, index) => Container(
              height: MediaQuery.of(context).size.height * 0.12,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: kWhiteBoxDecoration,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(16),
                          ),
                          color: Colors.green),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              cubit.barbersBySalonModel.data[index]
                                  .bearberNameAr,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: kDarkBlueColor),
                              textDirection: TextDirection.rtl,
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              '( ???????? )',
                              style:
                                  TextStyle(color: kPrimaryColor, fontSize: 18),
                            )
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
                            Text(
                              '???????????????? : 50',
                              style: TextStyle(color: Colors.pink),
                              textDirection: TextDirection.rtl,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(
                    width: 270,
                    child: CustomButton(
                      label: '???????? ????????',
                    )),
                SizedBox(
                  width: 20,
                ),
                CustomCloseButton(),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class ServiceRow extends StatelessWidget {
  const ServiceRow({
    Key key,
    this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          name,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: kDarkBlueColor, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
