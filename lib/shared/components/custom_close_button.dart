import 'package:flutter/material.dart';

import '../constants.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Color(0xffE6F6EB),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: kPrimaryColor)
      ),
      child: Icon(Icons.close,color: kPrimaryColor,size: 40,),
    );
  }
}