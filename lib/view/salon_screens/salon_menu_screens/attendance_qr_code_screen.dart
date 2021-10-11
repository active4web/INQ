import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';

class AttendanceQRCodeScreen extends StatelessWidget {
  const AttendanceQRCodeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightGreenColor,
        title: Text('QR الحضور',textDirection: TextDirection.rtl,),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('Please scan QR code from barber account'),
              SizedBox(height: 40,),
              Container(
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Assets/images/QR.png')
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
