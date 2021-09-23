import 'package:flutter/material.dart';
import 'package:work/view/user_screens/bottom_navigation_screens/user_home_screen.dart';


class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key key}) : super(key: key);
  static const String id = 'favouritesScreen';
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
        title: Text('المفضلة',style: TextStyle(
            color: Colors.black87
        ),),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SalonCard(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16,
                ),
                itemCount: 2
            ),
          ],
        ),
      ),
    );
  }
}
