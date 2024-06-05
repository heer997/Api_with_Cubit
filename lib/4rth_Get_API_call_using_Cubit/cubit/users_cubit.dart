import 'package:api_with_cubit/4rth_Get_API_call_using_Cubit/cubit/cubit_users_state.dart';
import 'package:api_with_cubit/4rth_Get_API_call_using_Cubit/models/users_model.dart';
import 'package:api_with_cubit/4rth_Get_API_call_using_Cubit/repositories/users_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<CubitUserState> {
  final UsersRepo usersRepo = UsersRepo();

  UsersCubit() : super(CubitUserLoading()) {
    getData();
  }

  getData() async {
    List<UsersModel> users = await usersRepo.getUsers();
    emit(CubitUserLoaded(users: users));
  }
}
