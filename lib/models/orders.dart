import 'package:cloud_firestore/cloud_firestore.dart';

class Orders {
  String image, title, id, fullname, giodat;
  int proid, cateid;
  double price;
  // DateTime createday, ngaydat;
  Timestamp ngaydat, createday;

  Orders(
      {required this.id,
      required this.cateid,
      required this.title,
      required this.price,
      required this.image,
      required this.fullname,
      required this.giodat,
      required this.proid,
      required this.createday,
      required this.ngaydat});

  factory Orders.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Orders(
      id: data["id"],
      cateid: data["cateid"],
      title: data['title'],
      image: data['image'],
      price: data["price"].toDouble(),
      createday: data["createday"],
      fullname: data["fullname"],
      giodat: data["giodat"],
      ngaydat: data["ngaydat"],
      proid: data["proid"],
    );
  }
}
