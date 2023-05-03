import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountInfoPage extends StatelessWidget {
  const AccountInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: FaIcon(FontAwesomeIcons.arrowLeft),
        //   color: Colors.black,
        // ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 170,
                    width: 170,
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
              Text(
                "Huy",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Admin@gmail.com"),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: Hero(
                  tag: "edit",
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/editprofile");
                    },
                    child: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade200,
                        shape: StadiumBorder()),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.pink.shade200,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, "/singin");
                    },
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: Icon(Icons.cottage),
                    ),
                    title: Text(
                      "LogOut",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.redAccent),
                    ),
                    trailing: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue.withOpacity(0.1),
                      ),
                      child: Icon(Icons.arrow_forward_sharp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
