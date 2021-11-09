import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    Key key, this.itemsList, this.onChanged, this.hint, this.value,
  }) : super(key: key);


  final List itemsList;
  final Function onChanged;
  final String hint;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height:50,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButton(
          underline: SizedBox(),
          isExpanded: true,
          onChanged: onChanged,
          items: itemsList,
          hint: Text(hint),
          value: value,

        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
            )
          ]),
    );
  }
}