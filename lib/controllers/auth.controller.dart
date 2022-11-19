import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthController {
  Future<String> loginUser(String email, String password) async {
    const url = 'https://go2climb.azurewebsites.net/api/v1/users/auth/sign-in';
    var response = await http.post(Uri.parse(url),
        body: json.encode({
          "email": email,
          "password": password,
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      return loginArr;
    } else {
      print("Login error");
      return 'Error!';
    }
  }
}
