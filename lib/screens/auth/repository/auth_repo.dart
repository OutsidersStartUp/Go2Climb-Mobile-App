import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  login(String email, String password) async {
    const url = 'https://go2climb.azurewebsites.net/api/v1/users/auth/sign-in';
    var response = await http.post(Uri.parse(url),
        body: json.encode({
          "email": email,
          "password": password,
        }),
        headers: {'Content-Type': 'application/json; charset=utf-8'});
    final data = json.decode(response.body);

    if (data['token'] != null) {
      return data;
    } else {
      return "There was a problem while authenticating";
    }
  }
}
