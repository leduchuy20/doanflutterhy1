import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doan_flutter/accountinfo/accountifopage.dart';
import 'package:doan_flutter/favourite/favouritepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:doan_flutter/home/home.dart';
import 'package:doan_flutter/onscreen/into_onscreen/getstartpage.dart';
import 'package:doan_flutter/onscreen/into_onscreen/splashscreen.dart';
import 'package:doan_flutter/test3.dart';
import 'package:doan_flutter/book/book.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doan_flutter/getallproduct/productpage.dart';

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
  final User = FirebaseAuth.instance.currentUser!;
  var selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    List screen = [
      HomePage(),
      FavouritePage(
        userid: User.uid,
      ),
      AccountInfoPage(),
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
            FaIcon(FontAwesomeIcons.house),
            Icon(Icons.history),
            Icon(Icons.account_circle)
          ]),
      body: screen[selectIndex],
    );
  }
}
