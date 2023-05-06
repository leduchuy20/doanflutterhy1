import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text("data"))),
    );
  }
}
