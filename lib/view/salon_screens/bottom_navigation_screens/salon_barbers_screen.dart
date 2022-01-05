import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';

class SalonBarbersScreen extends StatelessWidget {
  const SalonBarbersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalonCubit.get(context).generateSalonQrCode();
    return BlocBuilder<SalonCubit, SalonStates>(
      builder: (context, state) {
        SalonCubit cubit = SalonCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: kLightGreenColor,
            title: Text('ادارة الحلاقين'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    label: 'اضافة حلاق جديد',
                    onTab: () {
                      showCustomBottomSheet(
                          context: context,
                          content: Column(
                            children: [
                              Text(
                                'scan Salon QR code from barber account',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black87),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: MediaQuery.of(context).size.width * 0.6,
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: MemoryImage(cubit.salonQrImage),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                textDirection: TextDirection.rtl,
                                children: [
                                  SizedBox(
                                      width: 250,
                                      child: CustomButton(
                                        label: 'تم',
                                        onTab: () {
                                          Navigator.pop(context);
                                        },
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: kWhiteBoxDecoration.copyWith(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: kLightGreenColor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'Assets/images/Avatar.png'))),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'ادهم خالد',
                                          style: TextStyle(
                                              color: kDarkBlueColor,
                                              fontSize: 18),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        Text(
                                          'فرع : عمان',
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 16),
                                          textDirection: TextDirection.rtl,
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 70,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'متاح',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                                Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showCustomBottomSheet(
                                            context: context,
                                            content: Column());
                                      },
                                      child: Row(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.edit,
                                            size: 16,
                                            color: kPrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'تعديل',
                                            textDirection: TextDirection.rtl,
                                            style:
                                                TextStyle(color: kPrimaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      children: [
                                        Icon(
                                          Icons.playlist_add_check_outlined,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'شيت الحضور',
                                          textDirection: TextDirection.rtl,
                                          style:
                                              TextStyle(color: kDarkBlueColor),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 20,
                          ),
                      itemCount: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
