import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key key,
    this.label, this.controller, this.isSecured=false,
  }) : super(key: key);

  final String label;
  final controller;
  final bool isSecured;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
            )
          ]),
      child: TextFormField(
        controller: controller,
        obscureText: isSecured,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: label,
            hintTextDirection: TextDirection.rtl),
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
