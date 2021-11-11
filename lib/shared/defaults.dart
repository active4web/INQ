import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:work/shared/constants.dart';

import 'components/custom_button.dart';
import 'components/custom_close_button.dart';
import 'components/custom_form_field.dart';

void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigateReplacement(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => screen));
}

void navigateAndFinish(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => screen), (route) => false);
}

Future<bool> showToast({
  @required String text,
  @required Color color,
}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<dynamic> showCustomBottomSheet({BuildContext context, Widget content}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => StatefulBuilder(
            builder: (context, setState) => ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              child: Container(
                padding: EdgeInsets.all(20),

                //height: MediaQuery.of(context).size.height*0.5,
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                //height: 350,
                child: content,
              ),
            ),
          ));
}
