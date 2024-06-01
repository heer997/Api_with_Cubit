import 'package:api_with_cubit/1st_API_call_using_Cubit/API_services/api_services.dart';
import 'package:api_with_cubit/1st_API_call_using_Cubit/Model/users_details_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());

  Future<void> getDetails() async {
    try {
      emit(UserDetailsLoading());
      final details = await ApiServices.getDetails();
      if (details != null) {
        print("Data fetched successfully: ${details.users?.length}");
        emit(UserDetailsLoaded(usersDetailsModels: details));
      } else {
        print("Failed to fetch details");
        emit(UserDetailsError(errormsg: "Failed to fetch details"));
      }
    } catch (e) {
      print("Error fetching details: $e");
      emit(UserDetailsError(errormsg: e.toString()));
    }
  }
}
