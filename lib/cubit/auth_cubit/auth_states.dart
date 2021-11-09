abstract class AuthStates {}

class LoginInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class ChangePasswordVisibilityState extends AuthStates {}

class SignupLoadingState extends AuthStates{}

class SignupSuccessState extends AuthStates{}

class SignupErrorState extends AuthStates{}
