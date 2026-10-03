import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Email validation should reject invalid email', () {

    String? validateEmail(String? value) {

      if (value == null || value.trim().isEmpty) {
        return 'Please enter your email';
      }

      if (!value.contains('@')) {
        return 'Please enter a valid email';
      }

      return null;
    }

    expect(
      validateEmail('hello'),
      'Please enter a valid email',
    );

    expect(
      validateEmail('hello@gmail.com'),
      null,
    );
  });

}