import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> signup(String email, String password) async {
    const url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBJfO0GkP8Cb69MoQHwLU4ySqt-lJW1mIw';
    final response = await http.post(url,
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecuretoken': true,
        }));
    print(jsonDecode(response.body));

  }
}
