import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_flutter/accountinfo/editprofile/editprofileform.dart';
import 'package:doan_flutter/btnavigator/bottom.dart';
import 'package:doan_flutter/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailPage extends StatefulWidget {
  Products product;
  DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final name = TextEditingController();
  final sdt = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    sdt.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.product.image,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              widget.product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.product.des,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price: ${widget.product.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            // height: 2000,
                            // width: 300.0,
                            // height: 400.0,
                            child: AlertDialog(
                              // contentPadding: EdgeInsets.all(50.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              title: Text('Xác nhận mua hàng'),
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Image.asset(widget.product.image),
                                    SizedBox(height: 16.0),
                                    Text(widget.product.title),
                                    SizedBox(height: 8.0),
                                    Text('${widget.product.price} đ'),
                                    SizedBox(height: 16.0),
                                    inputformname(),
                                    SizedBox(height: 8.0),
                                    inputformsdt(),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Hủy'),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    // Thực hiện hành động khi người dùng chạm vào nút Mua hàng
                                    DocumentReference docRef =
                                        await FirebaseFirestore.instance
                                            .collection("orders")
                                            .add({
                                      "proid": widget.product.id,
                                      "image": widget.product.image,
                                      "title": widget.product.title,
                                      "date": DateTime.now(),
                                      "price": widget.product.price,
                                      "userid": user.uid,
                                      "fullname": name.text.trim(),
                                      "sdt": sdt.text.trim(),
                                      "cateid": widget.product.cateid
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => bottom(),
                                      ),
                                    );
                                    Fluttertoast.showToast(
                                        msg: "Đặt Lịch Thành Công",
                                        gravity: ToastGravity.BOTTOM);
                                    // Thực hiện thao tác để đặt hàng
                                  },
                                  child: Text('Mua hàng'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 70,
                      child: Center(
                        child: Text(
                          "Book",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        elevation: 0,
                        foregroundColor: Colors.red,
                        shape: StadiumBorder(),
                        side: BorderSide.none),
                  )
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  TextFormField inputformsdt() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Phone Number ";
        }
        return null;
      },
      controller: sdt,
      decoration: InputDecoration(
        label: Text("Phone Number"),
        // prefixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
      ),
    );
  }

  TextFormField inputformname() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Name ";
        }
        return null;
      },
      controller: name,
      decoration: InputDecoration(
        label: Text("Full Name"),
        // prefixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
      ),
    );
  }
}
