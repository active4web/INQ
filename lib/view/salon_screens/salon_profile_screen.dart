import 'package:flutter/material.dart';
import 'package:work/shared/components/custom_form_field.dart';
import 'package:work/shared/constants.dart';

class SalonProfileScreen extends StatelessWidget {
  const SalonProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('بيانات الصالون'),
        backgroundColor: kLightGreenColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomFormField(),
          ],
        ),
      ),
    );
  }
}
