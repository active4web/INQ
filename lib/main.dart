import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/barber_cubit/barber_cubit.dart';
import 'package:work/cubit/provider_cubit/provider_cubit.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/cubit/user_cubit/user_cubit.dart';
import 'package:work/shared/bloc_observer.dart';
import 'package:work/shared/constants.dart';
import 'package:work/view/auth_screens/login_screens/login_screen.dart';
import 'package:work/view/layouts/barber_layout.dart';
import 'package:work/view/layouts/provider_layout.dart';
import 'package:work/view/layouts/salon_layout.dart';
import 'package:work/view/layouts/user_layout.dart';

import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  kToken = CacheHelper.getData('token');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget getCurrentUser() {
    switch (kUserType) {
      case 'CUSTOMER':
        {
          return UserLayout();
        }
        break;
      case 'BARBER':
        {
          return BarberLayout();
        }
        break;
      case 'PROVIDER':
        {
          return ProviderLayout();
        }
        break;
      case 'BARBERSHOP':
        {
          return SalonLayout();
        }
        break;
      default:
        {
          return LoginScreen();
        }
      //return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => UserCubit()..fetchData()),
        BlocProvider(create: (context) => BarberCubit()),
        BlocProvider(create: (context) => ProviderCubit()),
        BlocProvider(create: (context) => SalonCubit()..fetchData()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: kToken == '' ? LoginScreen() : getCurrentUser(),
        theme: ThemeData(
            appBarTheme: AppBarTheme(centerTitle: true),
            fontFamily: 'Cairo',
            primarySwatch: Colors.green,
            canvasColor: Colors.transparent,
            scaffoldBackgroundColor: Color(0xfff8f8f8)),
      ),
    );
  }
}
