import 'package:api_with_cubit/3rd_Get_API_call_using_Cubit/Models/post_model.dart';
import 'package:api_with_cubit/3rd_Get_API_call_using_Cubit/service/api_service.dart';

class ApiRepositoryThird {
  final ApiServiceThird apiServiceThird;

  /// api repository is used to fetch data in cubit function
  ApiRepositoryThird({required this.apiServiceThird});

  Future<List<Post>?> getPostList() async {
    final response = await apiServiceThird.getPostData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data.map(
        (singlePost) {
          return Post.fromMap(singlePost);
        },
      ).toList();
    }
  }
}
