import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:story360/view/storyListing.dart';

void login(String email, String password, BuildContext context) async {
  const String url =
      'http://app360dev-001-site17.atempurl.com/api/Interview/SignIn';

  Response<Map<String, dynamic>> response = await Dio().post(
    url,
    data: {'email': email, 'password': password},
  );

  String status = response.data?['status'];

  if (response.statusCode == 200 && status == 'Success') {
    // Successful response
    String name = response.data?['content']?['firstName'] ?? 'DefaultName';

    String profile =
        response.data?['content']?['profilePicture'] ?? 'DefaultProfile';
    int pid = response.data?['content']?['id'] ?? -1;

    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StoryListing(
                name: name,
                profile: profile,
                userId: pid,
              )),
    );
  } else {
    // Handle non-200 status code

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content:
              const Text('Failed to log in. Please check your credentials.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
