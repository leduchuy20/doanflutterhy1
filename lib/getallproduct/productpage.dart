import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_flutter/book/book.dart';
import 'package:doan_flutter/getallproduct/components/body.dart';
import 'package:doan_flutter/getallproduct/components/itemcart.dart';
import 'package:doan_flutter/home/components/image_card.dart';
import 'package:doan_flutter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductPage extends StatelessWidget {
  int categoryId;
  ProductPage({super.key, required this.categoryId});

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
            onPressed: () {
              Navigator.pushNamed(context, "/search");
            },
            icon: Hero(
                tag: "search", child: FaIcon(FontAwesomeIcons.magnifyingGlass)),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SizedBox(width: 20),
                ImageCard(cardImg: "assets/images/spa1.png"),
                SizedBox(width: 20),
                ImageCard(cardImg: "assets/images/spa2.png"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.pink,
          ),
          Center(
            child: SizedBox(
              height: 36,
              child: Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(
            color: Colors.pink,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .where('cateid', isEqualTo: categoryId)
                    .snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final products = snapshot.data!.docs
                      .map((doc) => Products.fromFirestore(doc))
                      .toList();
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20),
                    itemCount: products.length,
                    itemBuilder: (context, int index) {
                      Products product = products[index];
                      return GestureDetector(
                        // onTap: () {
                        //   //FIXME: page 38
                        //   Navigator.pushNamed(context, "/detail",
                        //       arguments:
                        //           ProductDetailArguments(product: product));
                        // },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookPage(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              // child: Card(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                // height: 180,
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(10),
                                //   // color: Colors.black,
                                //   // image: DecorationImage(
                                //   //   image: Image.asset(product!.image).image,
                                //   //   fit: BoxFit.cover,
                                //   // ),
                                // ),
                                // color: Colors.black,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  image: DecorationImage(
                                      // colorFilter: ColorFilter.mode(
                                      //     Colors.black.withOpacity(0.4), BlendMode.darken),
                                      image: AssetImage(product.image),
                                      fit: BoxFit.fill),
                                ),
                                // child: Image.asset(product!.image),
                              ),
                              // elevation: 0,
                              // shape: RoundedRectangleBorder(
                              //   side: BorderSide(
                              //     color: Theme.of(context).colorScheme.surfaceVariant,
                              //   ),
                              //   borderRadius: const BorderRadius.all(Radius.circular(12)),
                              // ),
                              // ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                product.title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("\$${product.price}"),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      );
                      // return Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Expanded(
                      //       // child: Card(
                      //       child: Container(
                      //         padding: EdgeInsets.all(20),
                      //         // height: 180,
                      //         // decoration: BoxDecoration(
                      //         //   borderRadius: BorderRadius.circular(10),
                      //         //   // color: Colors.black,
                      //         //   // image: DecorationImage(
                      //         //   //   image: Image.asset(product!.image).image,
                      //         //   //   fit: BoxFit.cover,
                      //         //   // ),
                      //         // ),
                      //         // color: Colors.black,
                      //         decoration: BoxDecoration(
                      //           borderRadius:
                      //               const BorderRadius.all(Radius.circular(20)),
                      //           image: DecorationImage(
                      //               // colorFilter: ColorFilter.mode(
                      //               //     Colors.black.withOpacity(0.4), BlendMode.darken),
                      //               image: AssetImage(product.image),
                      //               fit: BoxFit.fill),
                      //         ),
                      //         // child: Image.asset(product!.image),
                      //       ),
                      //       // elevation: 0,
                      //       // shape: RoundedRectangleBorder(
                      //       //   side: BorderSide(
                      //       //     color: Theme.of(context).colorScheme.surfaceVariant,
                      //       //   ),
                      //       //   borderRadius: const BorderRadius.all(Radius.circular(12)),
                      //       // ),
                      //       // ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.symmetric(vertical: 5),
                      //       child: Text(
                      //         product.title,
                      //         style: TextStyle(fontWeight: FontWeight.bold),
                      //       ),
                      //     ),
                      //     Text("\$${product.price}"),
                      //     SizedBox(
                      //       height: 10.0,
                      //     ),
                      //   ],
                      // );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
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
