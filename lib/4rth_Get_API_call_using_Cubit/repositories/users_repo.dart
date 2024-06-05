import 'package:api_with_cubit/4rth_Get_API_call_using_Cubit/models/users_model.dart';
import "package:http/http.dart" as http;
import "package:http/http.dart";

class UsersRepo {
  static const usersUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<UsersModel>> getUsers() async {
    Response response = await http.get(
      Uri.parse(usersUrl),
    );
    return usersModelFromJson(response.body);
  }
}
