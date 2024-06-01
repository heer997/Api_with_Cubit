part of 'user_details_cubit.dart';

@immutable
sealed class UserDetailsState {}

final class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final UsersDetailsModels usersDetailsModels;

  UserDetailsLoaded({required this.usersDetailsModels});
}

class UserDetailsError extends UserDetailsState {
  final String errormsg;

  UserDetailsError({required this.errormsg});
}
