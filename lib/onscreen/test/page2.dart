import 'package:flutter/material.dart';
import 'package:doan_flutter/onscreen/test/screenpageitem.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPageItem(
          image: "https://assets7.lottiefiles.com/packages/lf20_s00z9gco.json",
          title: "Title 2",
          text: "Lựa chọn spa phù hợp"),
    );
  }
}
