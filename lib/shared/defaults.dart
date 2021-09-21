import 'dart:io';

import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';

void navigateTo(BuildContext context,Widget screen){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> screen));
}

void navigateReplacement(BuildContext context,Widget screen){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> screen));
}

void navigateAndFinish(BuildContext context,Widget screen){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) =>
      screen), (route) => false);
}

