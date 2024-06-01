import 'package:api_with_cubit/2nd_API_call_using_Cubit/API_services/api_services.dart';
import 'package:api_with_cubit/2nd_API_call_using_Cubit/Cubits/user_login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());

  userLogin(String email, String password) {
    emit(UserLoginLoading());
    ApiServicesSecond().userLogIn(email, password).then((value) {
      emit(UserLoginLoaded(loginModel: value!));
      print("UserToken: ${value.token}");
    }).onError((error, stackTrance) {
      print(error.toString());
      emit(UserLoginError(errormsg: error.toString()));
    });
  }
}
