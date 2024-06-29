// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fyp/core/models/user_model.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'apiURL//users/login',
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Login failed');
      }
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
      throw Exception('Login failed');
    }
  }
}
