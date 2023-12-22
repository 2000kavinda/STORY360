import 'dart:convert';
import 'package:dio/dio.dart';

void login(String email, String password) async {
  final String url =
      'http://app360dev-001-site17.atempurl.com/api/Interview/SignIn';

  Response<Map<String, dynamic>> response = await Dio().post(
    url,
    data: {'email': email, 'password': password},
  );

  if (response.statusCode == 200) {
    // Successful response
    print('Login successful!');
    print('Response Data: ${response.data}');
  } else {
    // Handle non-200 status code
    print('Login failed. Status code: ${response.statusCode}');
    print('Error message: ${response.data}');
  }
}
