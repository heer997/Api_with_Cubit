import 'package:api_with_cubit/2nd_API_call_using_Cubit/Model/login_model.dart';

abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class UserLoginLoading extends UserLoginState {}

class UserLoginLoaded extends UserLoginState {
  final LoginModel loginModel;

  UserLoginLoaded({required this.loginModel});
}

class UserLoginError extends UserLoginState {
  String errormsg;

  UserLoginError({required this.errormsg});
}
