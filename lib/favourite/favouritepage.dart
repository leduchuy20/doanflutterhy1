import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_flutter/history/detailhistory.dart';
import 'package:doan_flutter/models/orders.dart';
// import 'package:doan_flutter/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  String userid;
  FavouritePage({super.key, required this.userid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "History",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .where("userid", isEqualTo: userid)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final products = snapshot.data!.docs
                .map((doc) => Orders.fromFirestore(doc))
                .toList();
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                Orders product = products[index];
                DateTime ngaydat = product.ngaydat.toDate();
                DateTime dateTime = product.createday.toDate();
                String formattedDate =
                    "Ngày ${dateTime.day} Tháng ${dateTime.month} Năm ${dateTime.year}";
                String formattedNgayDat =
                    "Ngày ${ngaydat.day} Tháng ${ngaydat.month} Năm ${ngaydat.year}";
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailHistory(
                          orders: products[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              child: Text(formattedDate),
                            ),
                          ),
                          // Divider(),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  product.image,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        product.title,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Giá tiền: ${product.price.toString().replaceAll('.', '')} VND",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Ngày Đặt: $formattedNgayDat ${product.giodat.toString()}',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
