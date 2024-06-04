import "package:api_with_cubit/3rd_Get_API_call_using_Cubit/Models/failure_model.dart";
import "package:api_with_cubit/3rd_Get_API_call_using_Cubit/Models/post_model.dart";
import "package:api_with_cubit/3rd_Get_API_call_using_Cubit/repository/api_repository.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:equatable/equatable.dart";

part "post_fetch_state.dart";

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepositoryThird apiRepositoryThird;

  PostFetchCubit({required this.apiRepositoryThird})
      : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());
    try {
      final List<Post>? postList = await apiRepositoryThird.getPostList();
      emit(
        PostFetchLoaded(postList: postList ?? []),
      );
    } on Failure catch (error) {
      emit(
        PostFetchError(failure: error),
      );
    } catch (error) {
      print("Error: $error");
    }
  }
}
