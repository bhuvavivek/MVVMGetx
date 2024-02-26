import 'package:mvvmwithget/models/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferances {
  Future<bool> saveUserPreferences(LoginModel data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data.token.toString());

    return true;
  }

  Future<LoginModel> getUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // Get other preferences as needed
    return LoginModel(token: token);
  }

  Future<bool> removeUserPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}
