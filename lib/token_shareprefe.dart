import 'package:shared_preferences/shared_preferences.dart';

class TokenSharePrefences {

  // Function to save only the token to SharedPreferences
 static Future<void> saveToken(String tokan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", tokan);
    // Update the value of the observable
  }

// Function to load only the token from SharedPreferences
  static Future<String?> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loadToken =  prefs.getString("token");
    var loadedTokens = loadToken;
    return loadedTokens;
  }



  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
}