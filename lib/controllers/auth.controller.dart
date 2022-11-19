import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthController {
  Future loginUser(String email, String password) async {
    const url = 'https://go2climb.azurewebsites.net/api/v1/users/auth/sign-in';
    var response = await http.post(Uri.parse(url), body: json.encode({
      "email": email,
      "password": password,
    }),
    headers: {
        'Content-Type': 'application/json; charset=utf-8'
    });
    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      print(loginArr);
    } else {
      print("Login error");
    }
  }
}
