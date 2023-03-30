import 'package:flutter/material.dart';
import 'package:doan_flutter/onscreen/screenpageitem.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPageItem(
          image: "https://assets3.lottiefiles.com/packages/lf20_riczstsl.json",
          title: "Title 3",
          text: "text 3"),
    );
  }
}
