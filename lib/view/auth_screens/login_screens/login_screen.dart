import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/cubit/auth_cubit/auth_states.dart';
import 'package:work/cubit/salon_cubit/salon_cubit.dart';
import 'package:work/network/local/cache_helper.dart';
import 'package:work/shared/components/custom_button.dart';
import 'package:work/shared/constants.dart';
import 'package:work/shared/defaults.dart';
import 'package:work/shared/get_sys_codes.dart';
import 'package:work/view/auth_screens/signup_screens/signup_account_type_screen.dart';
import 'package:work/view/auth_screens/signup_screens/signup_screen.dart';
import 'package:work/view/layouts/barber_layout.dart';
import 'package:work/view/layouts/provider_layout.dart';
import 'package:work/view/layouts/salon_layout.dart';
import 'package:work/view/layouts/user_layout.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "loginScreen";
  final TextEditingController usrNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          if (state is LoginSuccessState) {
            CacheHelper.setData(
                key: 'userInfo', value: jsonEncode(state.loginModel));
            CacheHelper.setData(
                    key: 'token', value: state.loginModel.data.userLoginToken)
                .then((value) {
              kToken = CacheHelper.getData('token');
              switch (state.loginModel.data.usrType) {
                case 'CUSTOMER':
                  {
                    navigateAndFinish(context, UserLayout());
                    CacheHelper.setData(key: 'userType', value: 'CUSTOMER');
                  }
                  break;
                case 'BARBER':
                  {
                    navigateAndFinish(context, BarberLayout());
                    CacheHelper.setData(key: 'userType', value: 'BARBER');
                  }
                  break;
                case 'PROVIDER':
                  {
                    navigateAndFinish(context, ProviderLayout());
                    CacheHelper.setData(key: 'userType', value: 'PROVIDER');
                  }
                  break;
                case 'BARBERSHOP':
                  {
                    navigateAndFinish(context, SalonLayout());
                    CacheHelper.setData(key: 'userType', value: 'BARBERSHOP');
                    SalonCubit.get(context)
                        .getMySalonInfo(userName: usrNameController.text);
                  }
                  break;
              }
            });
          } else if (state is LoginErrorState) {
            showToast(text: "فشل تسجيل الدخول", color: Colors.red);
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('Assets/images/in Q.png'))),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'تسجيل الدخول',
                  style: TextStyle(
                    color: kDarkBlueColor,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: 'username',
                        controller: usrNameController,
                        isPass: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomPasswordFormField(
                        controller: passwordController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'هل نسيت كلمة المرور؟',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      state is LoginLoadingState
                          ? CircularProgressIndicator(
                              color: kPrimaryColor,
                            )
                          : CustomButton(
                              label: 'تسجيل الدخول',
                              onTab: () {
                                cubit.login(
                                    usrName: usrNameController.text,
                                    password: passwordController.text);
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, UserLayout.id, (route) => false);
                              },
                            ),
                      SizedBox(height: 60),
                      Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ليس لديك حساب ؟',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, SignUpScreen());
                            },
                            child: Text(
                              'انشأ حساب',
                              style: TextStyle(
                                  color: kDarkBlueColor, fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    this.hintText,
    this.icon,
    this.isPass,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final IconData icon;
  final bool isPass;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          blurRadius: 1,
        )
      ], borderRadius: BorderRadius.circular(30)),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: TextFormField(
          obscureText: isPass,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: IconButton(
              icon: Icon(
                icon,
                color: kPrimaryColor,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(30)),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordFormField extends StatelessWidget {
  const CustomPasswordFormField({
    Key key,
    this.controller,
    this.hintText = 'password',
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Container(
            //height: 50,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 1,
              )
            ], borderRadius: BorderRadius.circular(30)),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: TextFormField(
                controller: controller,
                obscureText: cubit.showPassword,
                decoration: InputDecoration(
                  hintText: hintText,
                  suffixIcon: IconButton(
                    icon: Icon(
                      cubit.passwordIcon,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      cubit.changePasswordVisibility();
                    },
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(30)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
