import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_flutter/btnavigator/bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileForm extends StatefulWidget {
  final String? userId;
  final String? email;
  const EditProfileForm({super.key, this.userId, this.email});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  String user = '';
  String email = '';
  final fullname = TextEditingController();
  final phone = TextEditingController();
  final age = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    user = widget.userId!;
    email = widget.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile $user",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: FaIcon(FontAwesomeIcons.arrowLeft),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/braid2.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.pink.shade200,
                        ),
                        child: Center(
                          child: FaIcon(FontAwesomeIcons.pencil),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.pink,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        initialValue: email,
                        enabled: false,
                        decoration: InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide(
                              color: Colors.pink,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EditProfileItem(
                        controller: fullname,
                        user: 'fullname',
                        icon: Icon(Icons.person_2_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EditProfileItem(
                        controller: phone,
                        user: 'Phone',
                        icon: Icon(Icons.phone_android),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EditProfileItem(
                        controller: age,
                        user: 'Age',
                        icon: Icon(Icons.cake_outlined),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Hero(
                          tag: "edit",
                          child: ElevatedButton(
                            onPressed: () {
                              updateUserInfo(user, fullname.text.trim(),
                                  int.parse(age.text), phone.text.trim());
                            },
                            child: Text("Edit Profile"),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink.shade200,
                                side: BorderSide.none,
                                shape: StadiumBorder()),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(
                        color: Colors.pink,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Joined: ",
                              style: TextStyle(fontSize: 12),
                              children: [
                                TextSpan(
                                    text: "Date",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Delete",
                              style: TextStyle(color: Colors.red),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: StadiumBorder(),
                                side: BorderSide.none),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateUserInfo(
      String userId, String fullname, int age, String phone) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).update({
        'fullname': fullname,
        'age': age,
        'phone': phone,
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => bottom(),
        ),
      );
      Fluttertoast.showToast(
          msg: "Bạn Đã Cập Nhật Thành Công", gravity: ToastGravity.BOTTOM);
    } catch (error) {
      print('Error updating user info: $error');
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
