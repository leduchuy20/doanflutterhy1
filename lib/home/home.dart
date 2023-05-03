import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doan_flutter/getallproduct/productpage.dart';
import 'package:doan_flutter/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../uidata.dart';
import 'components/image_card.dart';
import 'components/my_column.dart';
import 'components/specialist_column.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _categoryRef =
      FirebaseFirestore.instance.collection('categories');
  @override
  Widget build(BuildContext context) {
    final screen_size_width = MediaQuery.of(context).size.width;
    final screen_size_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.short_text, color: Colors.black87),
            onPressed: () {}),
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
      body: Container(
        width: screen_size_width,
        height: screen_size_height,
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: screen_size_height * .2,
                width: screen_size_width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    ImageCard(cardImg: "assets/images/braid4.jpg"),
                    SizedBox(width: 10),
                    ImageCard(cardImg: "assets/images/braid3.jpg"),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              StreamBuilder<QuerySnapshot>(
                stream: _categoryRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final categories = snapshot.data!.docs
                      .map((doc) => Categories.fromFirestore(doc))
                      .toList();
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      Categories cate = categories[index];
                      return GestureDetector(
                        onTap: () {
                          //FIXME: page 38
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                      categoryId: cate.cateid,
                                    )),
                          );
                        },
                        child: MyColumn(
                          columnImg: cate.image,
                          columnTxt: cate.title,
                          columnBg: UIData.lighterColor,
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   children: <Widget>[
              //     Expanded(
              //       child: InkWell(
              //         onTap: () => Navigator.pushNamed(context, "/getproduct"),
              //         child: const MyColumn(
              //           columnImg: "assets/images/braid.png",
              //           columnTxt: "Braids",
              //           columnBg: UIData.lightColor,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () =>
              //             Navigator.pushNamed(context, UIData.bookPageRoute),
              //         child: const MyColumn(
              //           columnImg: "assets/images/abuja.png",
              //           columnTxt: "Abuja",
              //           columnBg: UIData.lighterColor,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () =>
              //             Navigator.pushNamed(context, UIData.bookPageRoute),
              //         child: const MyColumn(
              //           columnImg: "assets/images/blow.png",
              //           columnTxt: "Blowdry",
              //           columnBg: UIData.lighterColor,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () =>
              //             Navigator.pushNamed(context, UIData.bookPageRoute),
              //         child: const MyColumn(
              //           columnImg: "assets/images/haircut.png",
              //           columnTxt: "Haircut",
              //           columnBg: UIData.lighterColor,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.max,
              //   children: <Widget>[
              //     Expanded(
              //       child: InkWell(
              //         onTap: () =>
              //             Navigator.pushNamed(context, UIData.bookPageRoute),
              //         child: const MyColumn(
              //           columnImg: "assets/images/relaxer.png",
              //           columnTxt: "Relaxer",
              //           columnBg: UIData.lighterColor,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () =>
              //             Navigator.pushNamed(context, UIData.bookPageRoute),
              //         child: const MyColumn(
              //           columnImg: "assets/images/shampoo.png",
              //           columnTxt: "Shampoo",
              //           columnBg: UIData.lighterColor,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () =>
              //             Navigator.pushNamed(context, UIData.bookPageRoute),
              //         child: const MyColumn(
              //           columnImg: "assets/images/nail.png",
              //           columnTxt: "Manicure",
              //           columnBg: UIData.lighterColor,
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () =>
              //             Navigator.pushNamed(context, UIData.bookPageRoute),
              //         child: const MyColumn(
              //           columnImg: "assets/images/more.png",
              //           columnTxt: "More",
              //           columnBg: UIData.lighterColor,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 6),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                        child: Text("Hair Specialists",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600))),
                    TextButton(
                        onPressed: () {},
                        child: const Text("View All",
                            style: TextStyle(color: Colors.black54)))
                  ]),
              const SizedBox(height: 6),
              Container(
                  height: 230,
                  width: screen_size_width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SpecialistColumn(
                          specImg: "assets/images/braid2.jpg",
                          specName: "Anny Roy"),
                      SizedBox(width: 12),
                      SpecialistColumn(
                          specImg: "assets/images/profile.jpg",
                          specName: "Joy Roy"),
                      SizedBox(width: 12),
                      SpecialistColumn(
                          specImg: "assets/images/braid3.jpg",
                          specName: "Patience Roy"),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
