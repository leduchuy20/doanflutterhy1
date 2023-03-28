import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:doan_flutter/home.dart';
import 'package:doan_flutter/test1.dart';
import 'package:doan_flutter/test2.dart';
import 'package:doan_flutter/test3.dart';
import 'package:doan_flutter/book.dart';

// class bottom extends StatelessWidget {
//   const bottom({super.key});
//   @override
//   Widget build(BuildContext context) {
//     List<Widget> screen = [];
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//           onTap: (index) {
//             print(index);
//           },
//           backgroundColor: Colors.white,
//           color: Colors.deepPurple.shade200,
//           items: [
//             Icon(Icons.home),
//             Icon(Icons.settings),
//             Icon(Icons.favorite),
//           ]),
//     );
//   }
// }
class bottom extends StatefulWidget {
  const bottom({super.key});

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  var selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screen = [
      HomePage(),
      BookPage(),
      test3(),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              selectIndex = index;
            });
          },
          backgroundColor: Colors.white,
          color: Colors.pink.shade200,
          items: [
            Icon(Icons.home),
            Icon(Icons.settings),
            Icon(Icons.favorite),
          ]),
      body: screen[selectIndex],
    );
  }
}