import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_flutter/book/book.dart';
import 'package:doan_flutter/home/components/my_column.dart';
import 'package:doan_flutter/models/product.dart';
import 'package:doan_flutter/uidata.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final CollectionReference productspre =
      FirebaseFirestore.instance.collection('products');
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Search",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: FaIcon(FontAwesomeIcons.arrowLeft),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search For Spa",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.pink.shade200, width: 2)),
                  hintText: "Input Text",
                  prefixIcon: Hero(
                      tag: "search",
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      )),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Divider(
                color: Colors.pink.shade200,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: productspre.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    var products = snapshot.data!.docs
                        .map((doc) => Products.fromFirestore(doc))
                        .toList();
                    // final searchResults = products
                    //     .where((product) => product.title!
                    //         .toString()
                    //         .toLowerCase()
                    //         .contains(searchQuery.toLowerCase()))
                    //     .toList();

                    products = products
                        .where((product) => product.title!
                            .toString()
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .toList();
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        Products pro = products[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookPage(),
                                ),
                              );
                            },
                            leading: Image.asset(pro.image),
                            title: Text(
                              pro.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            trailing: Text(pro.price.toString()),
                          ),
                        );
                      },
                    );
                  })
            ],
          ),
        ));
  }
}
