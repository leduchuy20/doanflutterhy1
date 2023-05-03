import 'package:flutter/material.dart';
import 'package:doan_flutter/onscreen/test/screenpageitem.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPageItem(
          image: "https://assets9.lottiefiles.com/packages/lf20_pvgte4uo.json",
          title: "Title 3",
          text: "text 3"),
    );
  }
}
