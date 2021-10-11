import 'package:flutter/material.dart';

import '../constants.dart';
import '../custom_icons.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({
    Key key, this.text='رفع صورة',
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kGreyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CustomIcons.photo_camera,color: kPrimaryColor,),
          SizedBox(height: 10,),
          Text(text,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 12,
              fontWeight: FontWeight.bold
          ),)
        ],
      ) ,
    );
  }
}