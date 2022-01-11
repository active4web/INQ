import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/barber_cubit/barber_cubit.dart';
import 'package:work/cubit/barber_cubit/barber_states.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';

class AddBarberServiceScreen extends StatelessWidget {
  const AddBarberServiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int serviceCode;
    TextEditingController hoursController = new TextEditingController();
    TextEditingController minutesController = new TextEditingController();
    TextEditingController priceController = new TextEditingController();
    return BlocConsumer<BarberCubit, BarberStates>(
      listener: (context, state) {
        if (state is InsertBarberServiceSuccessState) {
          showAlertDialogWithAction(
              imagePath: 'Assets/images/success.png',
              messageColor: kPrimaryColor,
              context: context,
              message: 'تم اضافة الخدمة بنجاح',
              buttonText: 'تم',
              action: () {
                BarberCubit.get(context).getBarberServices();
                Navigator.pop(context);
                Navigator.pop(context);
              });
        } else if (state is InsertBarberServiceErrorState) {
          showToast(text: 'فشل اضافة خدمة جديدة', color: Colors.red);
        }
      },
      builder: (context, state) {
        BarberCubit cubit = BarberCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kLightGreenColor,
            elevation: 0,
            title: Text('اضف خدمة'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        'اضافة خدمة',
                        style: TextStyle(
                          color: kDarkBlueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )
                    ],
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
                    height: 20,
                  ),
                  CustomFormField(
                    label: 'سعر الخدمة',
                    controller: priceController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      SizedBox(
                          width: 270,
                          child: state is InsertBarberServiceLoadingState
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                )
                              : CustomButton(
                                  label: 'حفظ',
                                  onTab: () {
                                    cubit.insertBarberService(
                                      neededHours: hoursController.text,
                                      neededMinutes: minutesController.text,
                                      serviceId: serviceCode,
                                      price: priceController.text,
                                      barberId: cubit
                                          .barberInfoModel.data[0].stpSbrId,
                                    );
                                  },
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
          ),
        );
      },
    );
  }
}
