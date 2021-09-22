import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key, this.label, this.onTab,
  }) : super(key: key);
  final String label;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: Text(label,style: TextStyle(
            color: Colors.white,
            fontSize: 16
        ),
          textDirection: TextDirection.rtl,
        ),
        ),
      ),
    );
  }
}