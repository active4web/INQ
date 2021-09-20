import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:work/shared/constants.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key key}) : super(key: key);
  static const String id = "onboardScreen";

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    PageController pageViewController = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom:80),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 2,
                controller: pageViewController,
                itemBuilder:(context, index) =>  OnboardContent(
                  imagePath: 'Assets/images/onboard-1.png',
                  title: 'الان سهلنا عليك',
                  subTitle: ' الان احجز دورك من مكانك بكل سهولة '
                      'بدلا من الانتظار لساعات في صالون الحلاقة',
                ),
              ),
            ),
            SmoothPageIndicator(controller: pageViewController, count: 2,
            effect: ExpandingDotsEffect(
              dotColor: kPrimaryColor,
              activeDotColor: kPrimaryColor
            ),),
            SizedBox(height: 60,),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 114,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(20))
                  ),
                  child: Center(
                    child: Text('تخطي',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white
                    ),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key key, this.imagePath, this.title, this.subTitle,
  }) : super(key: key);

  final String imagePath;
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
              )
            ),
          ),
          SizedBox(height: 40,),
          Text(title,style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),),
          SizedBox(height: 20,),
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            child: Text(subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          )
        ],
      ),
    );
  }
}
