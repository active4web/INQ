import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_pin_picker/map_pin_picker.dart';
import 'package:location/location.dart' as location;
import 'package:work/cubit/auth_cubit/auth_cubit.dart';

import '../constants.dart';

class LocationPickerScreen extends StatefulWidget {
  LocationPickerScreen({
    Key key,
  }) : super(key: key);

  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();

  @override
  void initState() {
    getMyCurrentLocation();
    super.initState();
  }

  double longitude, latitude;
  CameraPosition cameraPosition;
  Future<void> getMyCurrentLocation() async {
    var userLocation = await location.Location().getLocation();
    longitude = userLocation.longitude;
    latitude = userLocation.latitude;
    AuthCubit.get(context).lat = userLocation.latitude;
    AuthCubit.get(context).long = userLocation.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(
      userLocation.latitude,
      userLocation.longitude,
    );
    // update the ui with the address
    locationController.text =
        '${placemarks.first.street}, ${placemarks.first.subLocality}, ${placemarks.first.locality}';
    AuthCubit.get(context).location = locationController.text;
    setState(() {});
  }

  // CameraPosition cameraPosition = const CameraPosition(
  //   target: LatLng(30.033333, 31.233334),
  //   zoom: 14.4746,
  // );

  var locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: latitude == null || longitude == null
          ? Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
              ),
            )
          : Stack(
              alignment: Alignment.topCenter,
              children: [
                MapPicker(
                  // pass icon widget
                  iconWidget: Icon(
                    Icons.location_pin,
                    color: kPrimaryColor,
                    size: 50,
                  ),
                  //add map picker controller
                  mapPickerController: mapPickerController,
                  child: GoogleMap(
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: true,
                    mapToolbarEnabled: true,
                    mapType: MapType.normal,
                    //  camera position
                    initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    onCameraMoveStarted: () {
                      // notify map is moving
                      mapPickerController.mapMoving();
                      locationController.text = "checking ...";
                    },
                    onCameraMove: (cameraPosition) {
                      this.cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () async {
                      // notify map stopped moving
                      mapPickerController.mapFinishedMoving();
                      //get address name from camera position
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                        cameraPosition.target.latitude,
                        cameraPosition.target.longitude,
                      );

                      // update the ui with the address
                      locationController.text =
                          '${placemarks.first.street}, ${placemarks.first.subLocality}, ${placemarks.first.locality}';
                      AuthCubit.get(context).location = locationController.text;
                      AuthCubit.get(context).lat =
                          cameraPosition.target.latitude;
                      AuthCubit.get(context).long =
                          cameraPosition.target.longitude;
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).viewPadding.top + 52,
                  width: MediaQuery.of(context).size.width - 50,
                  //height: 50,
                  child: TextFormField(
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                    readOnly: true,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white54,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none),
                    controller: locationController,
                  ),
                ),
                // Positioned(
                //   bottom: 24,
                //   left: 24,
                //   right: 24,
                //   child: SizedBox(
                //     height: 50,
                //     child: TextButton(
                //       child: const Text(
                //         "تأكيد",
                //         style: TextStyle(
                //           fontWeight: FontWeight.w400,
                //           fontStyle: FontStyle.normal,
                //           color: Color(0xFFFFFFFF),
                //           fontSize: 19,
                //           // height: 19/19,
                //         ),
                //       ),
                //       onPressed: () {
                //         // AuthCubit.get(context).lat =
                //         //     cameraPosition.target.latitude;
                //         // AuthCubit.get(context).long =
                //         //     cameraPosition.target.longitude;
                //         // AuthCubit.get(context).location =
                //         //     locationController.text;
                //         print(
                //             "Location ${AuthCubit.get(context).lat} ${AuthCubit.get(context).long}");
                //         print("Address: ${AuthCubit.get(context).location}");
                //       },
                //       style: ButtonStyle(
                //         backgroundColor:
                //             MaterialStateProperty.all<Color>(kPrimaryColor),
                //         shape:
                //             MaterialStateProperty.all<RoundedRectangleBorder>(
                //           RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(15.0),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
    );
  }
}
