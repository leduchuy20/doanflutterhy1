import 'package:flutter/material.dart';
import 'package:doan_flutter/onscreen/screenpageitem.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPageItem(
          image: "assets/images/relax.png",
          title: "Title 2",
          text: "Lựa chọn spa phù hợp"),
    );
  }
}