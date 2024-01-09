// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider_app/views/home_screen.dart';

class AuthRepository {
  void main(
    String userName,
    String email,
    String password,
    BuildContext context,
  ) async {
    const url = 'https://seedswild.exarth.com/api/accounts/auth/login/';

    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'X-CSRFToken':
          'qUSIhEbXl5T3PcxABsH5D0TkV1q3jroRCxGRTM6CAsLL7SR0aNxaP0DYyheBbOp8',
    };

    final body = jsonEncode({
      'username': userName,
      'email': email,
      'password': password,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final apiKey = responseBody['key'];
        Fluttertoast.showToast(msg: 'Authentication key: $apiKey');

        // print('Authentication key: $apiKey');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => HomeScreen(),
          ),
        );
      } else if (response.statusCode == 400) {
        final errorResponse = jsonDecode(response.body);
        if (errorResponse.containsKey('password')) {
          Fluttertoast.showToast(msg: errorResponse['password'][0]);
          print('Password error: ${errorResponse['password'][0]}');
        } else if (errorResponse.containsKey('email')) {
          // Fix typo here
          Fluttertoast.showToast(msg: errorResponse['email'][0]);
        }
      } else if (response.statusCode == 401) {
        final errorResponse = jsonDecode(response.body);
        if (errorResponse.containsKey('non_field_errors')) {
          Fluttertoast.showToast(msg: errorResponse['non_field_errors'][0]);
          print('Unauthorized: ${errorResponse['non_field_errors'][0]}');
        } else {
          Fluttertoast.showToast(msg: 'Unauthorized: ${response.body}');
          print('Unauthorized: ${response.body}');
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Failed with status code: ${response.statusCode}');
        print('Failed with status code: ${response.statusCode}');
        print('Response: ${response.body}');
      }
    } catch (e) {
      // Exception occurred during the request
      print('Error: $e');
    }
  }

  Future<void> registerUser(
    String userName,
    String email,
    String password,
    String confromPassword,
  ) async {
    final url = Uri.parse(
        'https://seedswild.exarth.com/api/accounts/auth/registration/');

    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'X-CSRFToken':
          'qUSIhEbXl5T3PcxABsH5D0TkV1q3jroRCxGRTM6CAsLL7SR0aNxaP0DYyheBbOp8',
    };

    final body = jsonEncode({
      'username': userName,
      'email': email,
      'password1': password,
      'password2': confromPassword,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        // Registration successful, you may handle the response accordingly
        print('User registered successfully');
      } else {
        print('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
