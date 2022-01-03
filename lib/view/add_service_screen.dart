import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_states.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_dropdown_menu.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class AddServiceScreen extends StatelessWidget {
  const AddServiceScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int serviceCode;
    TextEditingController hoursController = new TextEditingController();
    TextEditingController minutesController = new TextEditingController();
    return BlocConsumer<SalonCubit, SalonStates>(
      listener: (context, state) {},
      builder: (context, state) {
        SalonCubit cubit = SalonCubit.get(context);
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
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      SizedBox(
                          width: 270,
                          child: state is InsertSalonServiceLoadingState
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                )
                              : CustomButton(
                                  label: 'حفظ',
                                  onTab: () {
                                    cubit.insertSalonService(
                                        salId:
                                            3 /*cubit.mySalonInfo.data[0].stpSalId*/,
                                        serviceId: serviceCode,
                                        neededHours: hoursController.text,
                                        neededMinutes: minutesController.text);
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
