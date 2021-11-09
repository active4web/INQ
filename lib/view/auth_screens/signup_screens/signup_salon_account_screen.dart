import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/components/custom_close_button.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/components/custom_image_picker.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/view/auth_screens/signup_screens/signup_account_type_screen.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_profile_screen.dart';

class SignUpSalonAccountScreen extends StatefulWidget {
  const SignUpSalonAccountScreen({Key key}) : super(key: key);

  @override
  State<SignUpSalonAccountScreen> createState() => _SignUpSalonAccountScreenState();
}

class _SignUpSalonAccountScreenState extends State<SignUpSalonAccountScreen> with AutomaticKeepAliveClientMixin{

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
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kDarkBlueColor,
          ),
        ),
        title:Text('تسجيل مشترك جديد', style:TextStyle(
            color: kDarkBlueColor
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
              children: [
                SizedBox(height: 30),
                Label(text: 'بيانات الصالون',),
                SizedBox(height: 30,),
                CustomFormField(label: 'اسم الصالون',),
                SizedBox(height: 20,),
                CustomFormField(label: 'اسم المالك',),
                SizedBox(height: 20,),
                CustomFormField(label: 'رقم الجوال',),
                SizedBox(height: 20,),
                CustomImagePicker(text: 'رفع الرخصة المهنية',),
                SizedBox(height: 20,),
                CustomImagePicker(text: 'رفع صورة الصالون',),
                SizedBox(height: 20,),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text('حدد الموقع على الخريطة',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Color(0xff707070),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
                SizedBox(height: 20,),
              ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.6,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            SizedBox(height: 20,),
            Text('يدعم التطبيق فروع أخرى بعد التسجيل',
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 15
            ),),
            SizedBox(height: 20,),
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 270,
                    child: CustomButton(label: 'التالي',
                      onTab: (){
                      },)),
                SizedBox(width: 20,),
                CustomCloseButton()
              ],
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
