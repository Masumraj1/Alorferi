import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';

class SignUpController extends GetxController {

   Future<void> CreateUser(String name, String email, String password, String confirmpassword) async {
    try {
      var url = Uri.parse("${Urls.apiServerBaseUrl}${Endpoints.registers}");
      var body ={
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmpassword
      };

      var response = await http.post(url, body: body);

      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var ss = jsonDecode(response.body);
        var pp = ss['data']['message'];
        print(pp);
        print("User create successful");
      } else {
        // Print more details about the response
        print("User create failed with status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
