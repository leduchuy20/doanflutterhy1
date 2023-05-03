import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categories {
  int cateid;
  String title;
  String image;
  Categories({required this.cateid, required this.title, required this.image});

  factory Categories.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Categories(
        cateid: data["cateid"], title: data["title"], image: data["image"]);
  }
  // static List<Categories> init() {
  //   List<Categories> data = [
  //     Categories(id: 1, title: 'Highland', image: 'assets/images/dish.png'),
  //     Categories(id: 2, title: 'Highland', image: 'assets/images/cart.png'),
  //     Categories(id: 3, title: 'Highland', image: 'assets/images/cart.png'),
  //     Categories(id: 4, title: 'Highland', image: 'assets/images/cart.png'),
  //     Categories(id: 5, title: 'Highland', image: 'assets/images/cart.png')
  //   ];
  //   return data;
  // }
}
