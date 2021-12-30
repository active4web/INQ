import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/auth_screens/login_screens/login_screen.dart';

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

void showAlertDialogWithAction(
    {BuildContext context,
    String message,
    Color messageColor = kPrimaryColor,
    String imagePath,
    String buttonText,
    Function action}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Color(0xffF8F8F8),
      contentPadding: EdgeInsets.all(40),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(image: AssetImage(imagePath)),
            SizedBox(
              height: 20,
            ),
            Text(
              message,
              style: TextStyle(fontSize: 18, color: messageColor),
              textDirection: TextDirection.rtl,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTab: action,
              label: buttonText,
            )
          ],
        ),
      ),
    ),
  );
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

void logOut(context) {
  CacheHelper.removeData('token');
  CacheHelper.removeData('userType')
      .then((value) => navigateAndFinish(context, LoginScreen()));
  CacheHelper.clearCache();
}

/// Print Long String
void printLongString(String text) {
  final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern
      .allMatches(text)
      .forEach((RegExpMatch match) => print(match.group(0)));
}
