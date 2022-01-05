import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/add_service_screen.dart';

class SalonServicesScreen extends StatefulWidget {
  const SalonServicesScreen({Key key}) : super(key: key);

  @override
  State<SalonServicesScreen> createState() => _SalonServicesScreenState();
}

class _SalonServicesScreenState extends State<SalonServicesScreen> {
  @override
  void initState() {
    SalonCubit.get(context).getSalonServices();
    super.initState();
  }

  int serviceCode;
  TextEditingController hoursController = new TextEditingController();
  TextEditingController minutesController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('الخدمات'),
          backgroundColor: kLightGreenColor,
        ),
        body: BlocConsumer<SalonCubit, SalonStates>(
          listener: (context, state) {
            if (state is DeleteSalonServiceSuccessState) {
              showAlertDialogWithAction(
                  context: context,
                  imagePath: 'Assets/images/deleted.png',
                  message: 'تم حذف الخدمة بنجاح',
                  messageColor: kPrimaryColor,
                  buttonText: 'تم',
                  action: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    SalonCubit.get(context).getSalonServices();
                  });
            } else if (state is DeleteSalonServiceErrorState) {
              showToast(text: 'فشل حذف الخدمة', color: Colors.red);
              Navigator.pop(context);
            } else if (state is DeleteSalonServiceLoadingState) {
              showLoadingDialogue(context);
            }
            if (state is UpdateSalonServiceSuccessState) {
              showAlertDialogWithAction(
                  imagePath: 'Assets/images/success.png',
                  messageColor: kPrimaryColor,
                  context: context,
                  message: 'تم تعديل الخدمة بنجاح',
                  buttonText: 'تم',
                  action: () {
                    SalonCubit.get(context).getSalonServices();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    hoursController.text = null;
                    minutesController.text = null;
                    serviceCode = null;
                  });
            } else if (state is UpdateSalonServiceErrorState) {
              showToast(text: 'فشل تعديل الخدمة', color: Colors.red);
            }
          },
          builder: (context, state) {
            SalonCubit cubit = SalonCubit.get(context);
            return cubit.salonServicesModel == null
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
                        // CustomFormField(label: 'عدد المقاعد بالصالون',),
                        // SizedBox(height: 20,),
                        CustomButton(
                          label: 'اضافة خدمة',
                          onTab: () {
                            navigateTo(context, AddServiceScreen());
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        cubit.salonServicesModel.data.length == 0
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                  ),
                                  Center(
                                      child: Text(
                                    'لا يوجد اي خدمات !',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )),
                                ],
                              )
                            : ListView.separated(
                                itemCount: cubit.salonServicesModel.data.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: kWhiteBoxDecoration.copyWith(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'الخدمة',
                                                  style: TextStyle(
                                                      color: kPrimaryColor),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                                Text(
                                                  'الوقت',
                                                  style: TextStyle(
                                                      color: kPrimaryColor),
                                                  // textDirection: TextDirection.rtl,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  cubit
                                                          .salonServicesModel
                                                          .data[index]
                                                          .servicesNameAr ??
                                                      '',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                                Text(
                                                  '${cubit.salonServicesModel.data[index].stpSsrNeedTimeHoure} hrs : '
                                                  '${cubit.salonServicesModel.data[index].stpSsrNeedTimeMinut} min',
                                                  style: TextStyle(
                                                      color: Colors.grey),
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
                                                  showEditSheet(
                                                      context, cubit, index);
                                                },
                                                child: Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    Icon(
                                                      FontAwesomeIcons.edit,
                                                      size: 18,
                                                      color:
                                                          Colors.orangeAccent,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      'تعديل',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                          color:
                                                              kDarkBlueColor),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  ensureDeleteMessage(
                                                      context: context,
                                                      text:
                                                          'هل تريد حذف الخدمة ؟',
                                                      onTap: () {
                                                        print(cubit
                                                            .salonServicesModel
                                                            .data[index]
                                                            .stpSsrId);
                                                        Navigator.pop(context);
                                                        cubit.deleteSalonService(
                                                            serviceId: cubit
                                                                .salonServicesModel
                                                                .data[index]
                                                                .stpSsrId);
                                                      });
                                                },
                                                child: Row(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .delete_outline_rounded,
                                                      color: Colors.redAccent,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'حذف',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: TextStyle(
                                                          color:
                                                              kDarkBlueColor),
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
        ));
  }

  void showEditSheet(BuildContext context, SalonCubit cubit, int index) {
    showCustomBottomSheet(
        context: context,
        content: Column(
          children: [
            Text(
              'تعديل الخدمة',
              style: TextStyle(
                  color: kDarkBlueColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 30,
            ),
            StatefulBuilder(
              builder: (context, setState) => CustomDropdownField(
                hint: 'الخدمة',
                itemsList: cubit.servicesCodes.data.map((e) {
                  return DropdownMenuItem(
                    child: Text(
                      e.scArDesc,
                      textDirection: TextDirection.rtl,
                    ),
                    value: e.scCode,
                    alignment: Alignment.centerRight,
                  );
                }).toList(),
                value: serviceCode,
                onChanged: (value) {
                  setState(() {
                    serviceCode = value;
                    print(serviceCode);
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomFormField(
              label: 'الوقت المستغرق ( ساعات )',
              controller: hoursController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomFormField(
              label: 'الوقت المستغرق ( دقائق )',
              controller: minutesController,
            ),
            SizedBox(
              height: 70,
            ),
            BlocBuilder<SalonCubit, SalonStates>(
              builder: (context, state) {
                return Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SizedBox(
                        width: 270,
                        child: state is UpdateSalonServiceLoadingState
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              )
                            : CustomButton(
                                label: 'حفظ',
                                onTab: () {
                                  cubit.updateSalonService(
                                    stpSsrId: cubit.salonServicesModel
                                        .data[index].stpSsrId,
                                    salId: cubit.mySalonInfo.data[0].stpSalId,
                                    neededMinutes: minutesController.text,
                                    neededHours: hoursController.text,
                                    stpSsrServicesId: serviceCode,
                                  );
                                },
                              )),
                    SizedBox(
                      width: 20,
                    ),
                    CustomCloseButton()
                  ],
                );
              },
            ),
          ],
        ));
  }
}
