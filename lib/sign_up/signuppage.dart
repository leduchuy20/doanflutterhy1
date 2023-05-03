import 'package:doan_flutter/sign_up/signupform.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpForm(),
    );
  }
}
