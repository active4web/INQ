import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:work/cubit/login_cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool showPassword = true;
  IconData passwordIcon = Icons.visibility;
  void changePasswordVisibility() {
    showPassword = !showPassword;
    passwordIcon = showPassword
        ? Icons.visibility
        : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }
}