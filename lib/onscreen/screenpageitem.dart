import 'package:flutter/material.dart';

class ScreenPageItem extends StatelessWidget {
  String image;
  String title;
  String text;
  ScreenPageItem(
      {super.key,
      required this.image,
      required this.title,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
            height: 500,
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  fontSize: 22,
                  letterSpacing: 1.3)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(height: 1.8, letterSpacing: 1.3),
          ),
        ],
      ),
    );
  }
}
