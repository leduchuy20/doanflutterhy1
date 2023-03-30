import 'package:flutter/material.dart';
import 'package:doan_flutter/onscreen/screenpageitem.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenPageItem(
      image: "https://assets3.lottiefiles.com/packages/lf20_riczstsl.json",
      title: "Tile 1",
      text: "Chào mừng đến Spa",
    ));
  }
}
