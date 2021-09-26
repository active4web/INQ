import 'package:flutter/material.dart';
import 'package:work/shared/constants.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key key}) : super(key: key);
  static const String id = 'AboutAppScreen';
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
        title: Text('عن التطبيق',style: TextStyle(
            color: Colors.black87
        ),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),
            width: MediaQuery.of(context).size.width*0.9,
            height: MediaQuery.of(context).size.height*0.75,
            decoration: kWhiteBoxDecoration,
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/images/in Q.png')
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Text('V1.1'),
                SizedBox(height: 30,),
                Text(kLoremIpsum,textDirection: TextDirection.rtl,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
