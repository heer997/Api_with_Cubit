import "dart:convert";
import "package:api_with_cubit/2nd_API_call_using_Cubit/Model/login_model.dart";
import "package:http/http.dart" as http;

class ApiServicesSecond {
  String baseUrl = "https://reqres.in/";

  Future<LoginModel?> userLogIn(String email, String password) async {
    var response = await http.post(
      Uri.parse("${baseUrl}api/login"),
      body: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      LoginModel logInModel = LoginModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }
}
