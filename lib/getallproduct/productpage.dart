import 'package:doan_flutter/getallproduct/components/body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: FaIcon(FontAwesomeIcons.cartShopping),
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Body(),
    );
  }
}

//   AppBar dAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: IconButton(
//         onPressed: () {},
//         icon: FaIcon(FontAwesomeIcons.arrowLeft),
//         color: Colors.black,
//       ),
//       actions: [
//         IconButton(
//           onPressed: () {},
//           icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
//           color: Colors.black,
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         IconButton(
//           onPressed: () {},
//           icon: FaIcon(FontAwesomeIcons.cartShopping),
//           color: Colors.black,
//         ),
//         SizedBox(
//           width: 10,
//         )
//       ],
//     );
//   }
// }
