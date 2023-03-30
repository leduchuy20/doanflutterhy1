import 'package:flutter/material.dart';
import '../uidata.dart';

class MyButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback? oppressed;
  const MyButton({super.key, this.btnText, this.oppressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      height: 40,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                side: const BorderSide(
                    color: Colors.grey, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
        onPressed: oppressed,
        child: Text(btnText!,
            style: const TextStyle(
                color: Colors.blue,
                fontSize: 15.5,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
