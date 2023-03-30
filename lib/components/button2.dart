import 'package:flutter/material.dart';
import '../uidata.dart';

class MyButton2 extends StatelessWidget {
  final String? btnText;
  final VoidCallback? oppressed;

  const MyButton2({super.key, this.btnText, this.oppressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 10),
      height: 30,
      child: TextButton(
        // color: UIData.mainColor,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.grey, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
        onPressed: oppressed,
        child: Text(btnText!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
