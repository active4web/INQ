import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/user_cubit/user_cubit.dart';
import 'package:work/view/auth_screens/login_screens/login_screen.dart';
import 'package:work/view/auth_screens/onboard_screens/onboard_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_screen.dart';
import 'package:work/view/layouts/user_layout.dart';
import 'package:work/view/notifications_screen.dart';
import 'package:work/view/user_screens/menu_screens/about_app_screen.dart';
import 'package:work/view/user_screens/menu_screens/customer_services.dart';
import 'package:work/view/user_screens/menu_screens/favourites_screen.dart';
import 'package:work/view/user_screens/menu_screens/privacy_screen.dart';
import 'package:work/view/user_screens/menu_screens/terms_and_conditions_screen.dart';
import 'package:work/view/user_screens/salon_screen.dart';

import 'cubit/login_cubit/login_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> UserCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // builder: (context, child) {
        //   return Directionality(textDirection: TextDirection.rtl, child: child);
        // },
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          OnBoardScreen.id: (context)=>OnBoardScreen(),
          SignUpScreen.id:  (context)=>SignUpScreen(),
          NotificationsScreen.id: (context)=>NotificationsScreen(),
          FavouritesScreen.id:(context)=>FavouritesScreen(),
          PrivacyScreen.id:(context)=>PrivacyScreen(),
          TermsAndConditionsScreen.id:(context)=>TermsAndConditionsScreen(),
          CustomerServicesScreen.id:(context)=>CustomerServicesScreen(),
          AboutAppScreen.id:(context)=>AboutAppScreen(),
          SalonScreen.id: (context)=>SalonScreen(),
          UserLayout.id: (context)=>UserLayout()
        },
        initialRoute: OnBoardScreen.id,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true
          ),
          fontFamily: 'Cairo',
          primarySwatch: Colors.green,
          canvasColor: Colors.transparent,
          scaffoldBackgroundColor: Color(0xfff8f8f8)
        ),

        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
