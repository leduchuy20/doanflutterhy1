import 'package:doan_flutter/sign_in/sgininpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formkey = GlobalKey<FormState>();
  final oldpassword = TextEditingController();
  final newpassword = TextEditingController();
  final confirmpw = TextEditingController();
  final User = FirebaseAuth.instance.currentUser!;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    oldpassword.dispose();
    newpassword.dispose();
    confirmpw.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        title: Text(
          "Reset Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                EditProfileItem(
                  controller: oldpassword,
                  user: "Old Password",
                  icon: Icon(Icons.no_encryption_gmailerrorred_outlined),
                ),
                SizedBox(
                  height: 16,
                ),
                EditProfileItem(
                  controller: newpassword,
                  user: "New Password",
                  icon: Icon(Icons.no_encryption_gmailerrorred_outlined),
                ),
                SizedBox(
                  height: 16,
                ),
                EditProfileItem(
                  controller: confirmpw,
                  user: "Confirm Password",
                  icon: Icon(Icons.no_encryption_gmailerrorred_outlined),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: updatePassword,
                    child: Text("Reset"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade200,
                      side: BorderSide.none,
                      shape: StadiumBorder(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool confirmResetPassword() {
    if (newpassword.text.trim() == confirmpw.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  void updatePassword() async {
    try {
      if (confirmResetPassword() && formkey.currentState!.validate()) {
        UserCredential userCredential = await User.reauthenticateWithCredential(
          EmailAuthProvider.credential(
            email: User.email.toString(),
            password: oldpassword.text.trim(),
          ),
        );
        await User.updatePassword(newpassword.text.trim());

        await FirebaseAuth.instance.signOut();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SinginPage(),
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password updated successfully'),
          ),
        );
      } else {
        Fluttertoast.showToast(msg: "2 Mật Khẩu Không Trùng Khớp");
      }
    } catch (e) {
      print(e);
    }
  }
}

class EditProfileItem extends StatelessWidget {
  TextEditingController controller;
  final String user;
  Icon icon;
  EditProfileItem(
      {super.key,
      required this.controller,
      required this.user,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Password";
        }
        return null;
      },
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        label: Text(user),
        prefixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
      ),
    );
  }
}
