import "dart:convert";
import "package:api_with_cubit/1st_API_call_using_Cubit/Model/users_details_model.dart";
import "package:http/http.dart" as http;

class ApiServices {
  /// 1st way to call API
  static Future<UsersDetailsModels?> getDetails() async {
    var response = await http.get(
      Uri.parse("https://dummyjson.com/users"),
    );
    if (response.statusCode == 200) {
      UsersDetailsModels usersDetailsModels =
          UsersDetailsModels.fromJson(jsonDecode(response.body));
      return usersDetailsModels;
    }
    return UsersDetailsModels();
  }

  /// 2nd way to call API
// static Future<UsersDetailsModels?> getDetails() async {
//   var response = await http.get(Uri.parse("https://dummyjson.com/users"));
//   if (response.statusCode == 200) {
//     return UsersDetailsModels.fromJson(jsonDecode(response.body));
//   }
//   return null;
// }
}
