import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/cubit/barber_cubit/barber_cubit.dart';
import 'package:work/cubit/barber_cubit/barber_cubit.dart';
import 'package:work/cubit/barber_cubit/barber_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/custom_icons.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/salon_screens/add_salon_service_screen.dart';
import 'package:work/view/salon_screens/add_salon_service_screen.dart';

import 'add_barber_service_screen.dart';

class BarberServicesScreen extends StatefulWidget {
  const BarberServicesScreen({Key key}) : super(key: key);

  @override
  _BarberServicesScreenState createState() => _BarberServicesScreenState();
}

class _BarberServicesScreenState extends State<BarberServicesScreen>
    with SingleTickerProviderStateMixin {
  var _tabController;
  @override
  void initState() {
    super.initState();
    BarberCubit.get(context).getBarberServices();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 1);
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
        title: Text('صالوني'),
        elevation: 0,
        backgroundColor: kLightGreenColor,
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.09,
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: kPrimaryColor,
              unselectedLabelColor: Colors.grey,
              tabs: [Text('الخدمات'), Text('مواعيد العمل')],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BarberServicesTabScreen(),
          BarberTimeTabScreen(),
        ],
      ),
    );
  }
}

class BarberTimeTabScreen extends StatelessWidget {
  const BarberTimeTabScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CustomButton(
            label: 'اضافة موعد',
          ),
          SizedBox(
            height: 24,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: kWhiteBoxDecoration.copyWith(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    height: 150,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    'اليوم : ',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    width: 80,
                                  ),
                                  Text(
                                    'السبت',
                                    style: TextStyle(color: Colors.grey),
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                  )
                                ],
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    'الفترة الأولي : ',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    '9:00 AM - 3:00 PM',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey),
                                    softWrap: true,
                                  )
                                ],
                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Text(
                                    'الفترة الثانية : ',
                                    textDirection: TextDirection.rtl,
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Text(
                                    '5:00 PM - 10:00 PM',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.grey),
                                    softWrap: true,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Expanded(
                            flex: 2,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showCustomBottomSheet(
                                        context: context,
                                        content: Column(
                                          children: [
                                            Text(
                                              'تعديل الوقت',
                                              style: TextStyle(
                                                  color: kDarkBlueColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                              textDirection: TextDirection.rtl,
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            CustomFormField(
                                              label: 'الفترة',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            CustomFormField(
                                              label: 'من',
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            CustomFormField(
                                              label: 'الي',
                                            ),
                                            SizedBox(
                                              height: 70,
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                SizedBox(
                                                    width: 270,
                                                    child: CustomButton(
                                                      label: 'حفظ',
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
                                  child: Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.edit,
                                        size: 18,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'تعديل',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(color: kDarkBlueColor),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Icon(
                                      CustomIcons.suitcases,
                                      color: kPrimaryColor,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'اجازة',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(color: kDarkBlueColor),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: 10),
        ],
      ),
    ));
  }
}

class BarberServicesTabScreen extends StatelessWidget {
  const BarberServicesTabScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BarberCubit, BarberStates>(
      listener: (context, state) {
        if (state is DeleteBarberServiceSuccessState) {
          showAlertDialogWithAction(
              context: context,
              imagePath: 'Assets/images/deleted.png',
              message: 'تم حذف الخدمة بنجاح',
              messageColor: kPrimaryColor,
              buttonText: 'تم',
              action: () {
                Navigator.pop(context);
                Navigator.pop(context);
                BarberCubit.get(context).getBarberServices();
              });
        } else if (state is DeleteBarberServiceErrorState) {
          showToast(text: 'فشل حذف الخدمة', color: Colors.red);
          Navigator.pop(context);
        } else if (state is DeleteBarberServiceLoadingState) {
          showLoadingDialogue(context);
        }
        // if (state is UpdateSalonServiceSuccessState) {
        //   showAlertDialogWithAction(
        //       imagePath: 'Assets/images/success.png',
        //       messageColor: kPrimaryColor,
        //       context: context,
        //       message: 'تم تعديل الخدمة بنجاح',
        //       buttonText: 'تم',
        //       action: () {
        //         SalonCubit.get(context).getSalonServices();
        //         Navigator.pop(context);
        //         Navigator.pop(context);
        //         hoursController.text = null;
        //         minutesController.text = null;
        //         serviceCode = null;
        //       });
        // } else if (state is UpdateSalonServiceErrorState) {
        //   showToast(text: 'فشل تعديل الخدمة', color: Colors.red);
        // }
      },
      builder: (context, state) {
        BarberCubit cubit = BarberCubit.get(context);
        return cubit.barberServicesModel == null
            ? Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      label: 'اضافة خدمة',
                      onTab: () {
                        navigateTo(context, AddBarberServiceScreen());
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      itemCount: cubit.barberServicesModel.data.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: kWhiteBoxDecoration.copyWith(
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 130,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'الخدمة',
                                        style: TextStyle(color: kPrimaryColor),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                        'الوقت',
                                        style: TextStyle(color: kPrimaryColor),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                        'السعر',
                                        style: TextStyle(color: kPrimaryColor),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cubit.barberServicesModel.data[index]
                                            .stpSrvName,
                                        style: TextStyle(color: Colors.grey),
                                        textDirection: TextDirection.rtl,
                                      ),
                                      Text(
                                        '${cubit.barberServicesModel.data[index].stpSbsNeededHoure} hrs : '
                                        '${cubit.barberServicesModel.data[index].stpSbsNeededMinutes} min',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        cubit.barberServicesModel.data[index]
                                                .stpSbsPrice
                                                .toString() +
                                            'دينار',
                                        style: TextStyle(color: Colors.grey),
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Expanded(
                                flex: 2,
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showCustomBottomSheet(
                                            context: context,
                                            content: Column(
                                              children: [
                                                Text(
                                                  'تعديل الخدمة',
                                                  style: TextStyle(
                                                      color: kDarkBlueColor,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                CustomFormField(
                                                  label: 'قص شعر',
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                CustomFormField(
                                                  label: 'المدة',
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                CustomFormField(
                                                  label: 'السعر',
                                                ),
                                                SizedBox(
                                                  height: 70,
                                                ),
                                                Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    SizedBox(
                                                        width: 270,
                                                        child: CustomButton(
                                                          label: 'حفظ',
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
                                      child: Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.edit,
                                            size: 18,
                                            color: Colors.orangeAccent,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'تعديل',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                color: kDarkBlueColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        ensureDeleteMessage(
                                            context: context,
                                            text: 'هل تريد حذف الخدمة ؟',
                                            onTap: () {
                                              print(cubit.barberServicesModel
                                                  .data[index].stpSbsId);
                                              Navigator.pop(context);
                                              cubit.deleteBarberService(
                                                  serviceId: cubit
                                                      .barberServicesModel
                                                      .data[index]
                                                      .stpSbsId);
                                            });
                                      },
                                      child: Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Icon(
                                            Icons.delete_outline_rounded,
                                            color: Colors.redAccent,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'حذف',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                color: kDarkBlueColor),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ));
      },
    );
  }
}
