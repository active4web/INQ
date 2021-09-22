import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: kBoxDecoration,
      child: Center(
        child: TextFormField(
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'ابحث عن صالون أو خدمة',
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(
                  color: kGreyColor
              ),
              prefixIcon: IconButton(
                icon: Icon(Icons.search,color: kGreyColor,),
              ),
              contentPadding: EdgeInsets.all(10)
          ),
        ),
      ),
    );
  }
}