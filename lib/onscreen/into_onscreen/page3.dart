import 'package:flutter/material.dart';
import 'package:doan_flutter/onscreen/screenpageitem.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPageItem(
          image: "assets/images/massage.png", title: "Title 3", text: "text 3"),
    );
  }
}
