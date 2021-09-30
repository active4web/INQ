import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/barber_cubit/barber_cubit.dart';
import 'package:work/cubit/provider_cubit/provider_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/user_cubit/user_cubit.dart';
import 'package:work/view/auth_screens/login_screens/login_screen.dart';
import 'package:work/view/auth_screens/onboard_screens/onboard_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_screen.dart';
import 'package:work/view/layouts/barber_layout.dart';
import 'package:work/view/layouts/provider_layout.dart';
import 'package:work/view/layouts/salon_layout.dart';
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
        BlocProvider(create: (context)=>BarberCubit()),
        BlocProvider(create: (context)=> ProviderCubit()),
        BlocProvider(create: (context)=>SalonCubit()),
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
          ProviderLayout.id: (context)=>ProviderLayout(),
          BarberLayout.id: (context)=>BarberLayout(),
          SalonLayout.id: (context)=>SalonLayout(),
          UserLayout.id: (context)=>UserLayout()
        },
        initialRoute: SalonLayout.id,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true
          ),
          fontFamily: 'Cairo',
          primarySwatch: Colors.green,
          canvasColor: Colors.transparent,
          scaffoldBackgroundColor: Color(0xfff8f8f8)
        ),
      ),
    );
  }
}
