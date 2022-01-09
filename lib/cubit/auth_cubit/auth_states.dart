import 'package:work/cubit/auth_cubit/auth_cubit.dart';
import 'package:work/models/auth_models/login_success_model.dart';
import 'package:work/models/auth_models/response_fail_model.dart';

abstract class AuthStates {}

class LoginInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  LoginSuccessState({this.loginModel});
  final LoginSuccessModel loginModel;
}

class LoginErrorState extends AuthStates {
  LoginErrorState({this.error});
  final ResponseFailModel error;
}

class ChangePasswordVisibilityState extends AuthStates {}

class GetSysDataSuccessState extends AuthStates {}

class SignupLoadingState extends AuthStates {}

class SignupSuccessState extends AuthStates {}

class SignupErrorState extends AuthStates {}

class CreateOtpLoadingState extends AuthStates {}

class CreateOtpSuccessState extends AuthStates {}

class CreateOtpErrorState extends AuthStates {}

class CheckOtpLoadingState extends AuthStates {}

class CheckOtpSuccessState extends AuthStates {}

class CheckOtpErrorState extends AuthStates {}

class PickImageSuccessState extends AuthStates {}

class PickFileSuccessState extends AuthStates {}

class InsertSalonLoadingState extends AuthStates {}

class InsertSalonSuccessState extends AuthStates {}

class InsertSalonErrorState extends AuthStates {}

class InsertBarberLoadingState extends AuthStates {}

class InsertBarberSuccessState extends AuthStates {}

class InsertBarberErrorState extends AuthStates {}
