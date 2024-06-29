import 'package:fyp/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('userId', int.parse(user.id??''));
    prefs.setString('username', user.username??'');
    prefs.setString('email', user.email!);
    prefs.setString('token', user.token??'');

    // ignore: deprecated_member_use
    return prefs.commit();
  }

  Future<UserModel> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int userId = prefs.getInt("userId") ?? 0;
    String username = prefs.getString("username") ?? "";
    String email = prefs.getString("email") ?? "";
    String token = prefs.getString("token") ?? "";

    return UserModel(
      id: userId.toString(),
      username: username,
      email: email,
      token: token,
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('userId');
    prefs.remove('username');
    prefs.remove('email');
    prefs.remove('token');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token") ?? "";
    return token;
  }
}
