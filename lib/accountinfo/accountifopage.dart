import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            "https://assets1.lottiefiles.com/private_files/lf30_bcVsEA.json"),
      ),
    );
  }
}
