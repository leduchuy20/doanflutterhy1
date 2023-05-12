import 'package:doan_flutter/models/orders.dart';
import 'package:flutter/material.dart';

class DetailHistory extends StatelessWidget {
  Orders? orders;
  DetailHistory({super.key, this.orders});

  @override
  Widget build(BuildContext context) {
    DateTime ngaydat = orders!.ngaydat.toDate();
    String formattedNgayDat =
        "Ngày ${ngaydat.day} Tháng ${ngaydat.month} Năm ${ngaydat.year}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Detail History",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            orders!.image,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                orders!.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Giá Tiền: ${orders!.price.toString()}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Ngày Đặt: $formattedNgayDat ${orders!.giodat.toString()}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
