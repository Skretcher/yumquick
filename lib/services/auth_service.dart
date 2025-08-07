import 'dart:async';
import '../models/user.dart';

class AuthService {
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email.toLowerCase() == 'ark@arktini.com' && password == 'Ark123') {
      return User(
        id: '1',
        name: 'Ark User',
        email: email,
        token: 'mocked-auth-token',
        mobile: '9999999999',
        dob: '1990-01-01',
      );
    } else {
      return null;
    }
  }

  Future<User?> signup({
    required String name,
    required String email,
    required String password,
    required String mobile,
    required String dob,
  }) async {
    await Future.delayed(const Duration(seconds: 2));

    // Simulate already registered email
    if (email.endsWith('@example.com')) {
      return null;
    }

    return User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      token: 'mocked-signup-token',
      mobile: mobile,
      dob: dob,
    );
  }
}
