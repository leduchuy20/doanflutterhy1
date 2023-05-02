import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({super.key});

  @override
  State<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final user = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final age = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
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
                      EditProfileItem(
                        controller: email,
                        user: 'Email',
                        icon: Icon(Icons.email_outlined),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      EditProfileItem(
                        controller: user,
                        user: 'User',
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
                            onPressed: () {},
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
