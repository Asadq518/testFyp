import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp/config/api_config.dart';
import 'package:dio/dio.dart';

class AuthProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  Future<Map<String, dynamic>> register(String email, String password) async {
    try {
      var response = await _dio.post("http://${Config.apiURL}/users/register",
          data: {'email': email, 'password': password},
          options: Options(headers: {'Content-Type': 'application/json'}));

      return response.data;
    } catch (err) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      notifyListeners();

      var response = await _dio.post(
        "http://${Config.apiURL}/users/login",
        data: {'email': email, 'password': password},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        notifyListeners();
        return response.data;
      } else {
        notifyListeners();
        return {'status': false, 'message': 'Failed to login'};
      }
    } catch (err) {
      notifyListeners();
      return {'status': false, 'message': 'Error during login'};
    }
  }
}
