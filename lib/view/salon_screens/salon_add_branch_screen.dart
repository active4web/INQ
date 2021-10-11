import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/barber_screens/settings_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class AddBranchScreen extends StatefulWidget {
  const AddBranchScreen({Key key}) : super(key: key);

  @override
  _AddBranchScreenState createState() => _AddBranchScreenState();
}

class _AddBranchScreenState extends State<AddBranchScreen> with AutomaticKeepAliveClientMixin{

  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('اضافة فرع'),
        backgroundColor: kLightGreenColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Label(text: 'بيانات الفرع'),
              SizedBox(height: 20,),
              CustomFormField(label: 'اسم الفرع',),
              SizedBox(height: 20,),
              CustomFormField(label: 'البلد',),
              SizedBox(height: 20,),
              CustomFormField(label: 'المدينة',),
              SizedBox(height: 20,),
              CustomFormField(label: 'المنطقة',),
              SizedBox(height: 20,),
              CustomImagePicker(),
              SizedBox(height: 20,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text('حدد الموقع على الخريطة',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        color: Colors.black54
                    ),),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                height: MediaQuery.of(context).size.height*0.5,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
              SizedBox(height: 30,),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                      width: 270,
                      child: CustomButton(label: 'حفظ',)),
                  SizedBox(width: 20,),
                  CustomCloseButton()
                ],
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
