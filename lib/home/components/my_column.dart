import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  final String? columnImg, columnTxt;
  final Color? columnBg;

  const MyColumn({super.key, this.columnImg, this.columnTxt, this.columnBg});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: columnBg,
          ),
          child: Image(image: AssetImage(columnImg!), fit: BoxFit.contain),
        ),
        const SizedBox(height: 10),
        Text(columnTxt!),
        const SizedBox(height: 10)
      ],
    );
  }
}
