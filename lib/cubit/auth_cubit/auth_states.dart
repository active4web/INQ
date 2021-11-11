abstract class AuthStates {}

class LoginInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class ChangePasswordVisibilityState extends AuthStates {}

class SignupLoadingState extends AuthStates{}

class SignupSuccessState extends AuthStates{}

class SignupErrorState extends AuthStates{}

class CreateOtpLoadingState extends AuthStates{}

class CreateOtpSuccessState extends AuthStates{}

class CreateOtpErrorState extends AuthStates{}

class CheckOtpLoadingState extends AuthStates{}

class CheckOtpSuccessState extends AuthStates{}

class CheckOtpErrorState extends AuthStates{}

class PickImageSuccessState extends AuthStates{}
