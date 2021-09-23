import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key key}) : super(key: key);
  static const String id = 'notificationsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black87,),
        ),
        title: Text('التنبيهات',style: TextStyle(
            color: Colors.black87
        ),),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            height: MediaQuery.of(context).size.height*0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/images/noNotification.png')
              )
            ),
          ),
          SizedBox(height: 20,),
          Center(child: Text('  لا يوجد تنبيهات جديدة',style: TextStyle(
            fontSize: 16,
          ),),)
        ],
      ),
    );
  }
}
