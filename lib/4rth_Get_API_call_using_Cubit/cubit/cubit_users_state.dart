import 'package:api_with_cubit/4rth_Get_API_call_using_Cubit/models/users_model.dart';

abstract class CubitUserState {}

class CubitUserLoading extends CubitUserState {}

class CubitUserLoaded extends CubitUserState {
  List<UsersModel> users;

  CubitUserLoaded({required this.users});
}
