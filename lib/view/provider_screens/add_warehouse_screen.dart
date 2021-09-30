import 'dart:async';

import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddWarehouseScreen extends StatefulWidget {
  const AddWarehouseScreen({Key key}) : super(key: key);

  @override
  _AddWarehouseScreenState createState() => _AddWarehouseScreenState();
}

class _AddWarehouseScreenState extends State<AddWarehouseScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        elevation: 0,
        title: Text('اضافة مخزن'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Text('اضافة مخزن',style: TextStyle(
                        color: kDarkBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  CustomFormField(label: 'رقم المخزن',),
                  SizedBox(height: 14,),
                  CustomFormField(label: 'اسم المخزن',),
                  SizedBox(height: 50,),
                ],
              ),
            ),
            Text('حدد الموقع على الخريطة',
            style: TextStyle(
              color: Colors.black54
            ),),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height*0.35,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  SizedBox(
                      width: 270,
                      child: CustomButton(label: 'حفظ',)),
                  SizedBox(width: 20,),
                  CustomCloseButton()
                ],
              ),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
