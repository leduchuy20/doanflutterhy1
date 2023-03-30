import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'uidata.dart';
import 'image_card.dart';
import 'my_column.dart';
import 'specialist_column.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        actions: <Widget>[
          Container(
            decoration: const BoxDecoration(),
            margin: const EdgeInsets.only(right: 15, top: 15),
            child: const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(
                "assets/images/profile.jpg",
              ),
            ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.pushNamed(context, "/getproduct"),
                      child: const MyColumn(
                        columnImg: "assets/images/braid.png",
                        columnTxt: "Braids",
                        columnBg: UIData.lightColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: const MyColumn(
                        columnImg: "assets/images/abuja.png",
                        columnTxt: "Abuja",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: const MyColumn(
                        columnImg: "assets/images/blow.png",
                        columnTxt: "Blowdry",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: const MyColumn(
                        columnImg: "assets/images/haircut.png",
                        columnTxt: "Haircut",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: const MyColumn(
                        columnImg: "assets/images/relaxer.png",
                        columnTxt: "Relaxer",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: const MyColumn(
                        columnImg: "assets/images/shampoo.png",
                        columnTxt: "Shampoo",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: const MyColumn(
                        columnImg: "assets/images/nail.png",
                        columnTxt: "Manicure",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, UIData.bookPageRoute),
                      child: const MyColumn(
                        columnImg: "assets/images/more.png",
                        columnTxt: "More",
                        columnBg: UIData.lighterColor,
                      ),
                    ),
                  ),
                ],
              ),
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
