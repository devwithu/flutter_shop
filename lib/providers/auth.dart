import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyBJfO0GkP8Cb69MoQHwLU4ySqt-lJW1mIw';
    final response = await http.post(url,
        body: jsonEncode({
          'email': email,
          'password': password,
          'returnSecuretoken': true,
        }));
    print(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');

  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
