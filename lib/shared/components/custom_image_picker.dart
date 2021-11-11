import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nil/nil.dart';

import '../constants.dart';
import '../custom_icons.dart';



class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({
    Key key, this.text='رفع صورة', this.onTab, this.imageFile,
  }) : super(key: key);

  final String text;
  final Function onTab;
  final XFile imageFile;
  @override
  Widget build(BuildContext context) {
    File file;
    if(imageFile != null){
    file = File( imageFile.path);
    }
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: imageFile != null
              ? DecorationImage(
              image: FileImage(file),
              fit: BoxFit.contain)
              : null,
          color: Colors.white,
          border: Border.all(color: kGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child:imageFile == null
            ? Column(
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
        ):nil,
      ),
    );
  }
}