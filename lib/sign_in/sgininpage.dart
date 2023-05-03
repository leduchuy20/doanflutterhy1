import 'package:doan_flutter/btnavigator/bottom.dart';
import 'package:doan_flutter/sign_in/siginform.dart';
import 'package:doan_flutter/sign_up/signupform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SinginPage extends StatelessWidget {
  const SinginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // } else if (snapshot.hasError) {
          //   return Center(
          //     child: Text("Tai khoan khong dung"),
          //   );
          // }
          if (snapshot.hasData) {
            return bottom();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
