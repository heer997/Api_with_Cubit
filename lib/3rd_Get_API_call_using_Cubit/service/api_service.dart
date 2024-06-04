import "package:dio/dio.dart";

class ApiServiceThird {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response response =
          await _dio.get("https://jsonplaceholder.typicode.com/posts");
      return response;
    } catch (error) {
      print("Error: $error");
    }
  }
}
