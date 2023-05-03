import 'package:doan_flutter/sign_in/sgininpage.dart';
import 'package:doan_flutter/sign_in/siginform.dart';
import 'package:flutter/material.dart';

import '../btnavigator/bottom.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final phone = TextEditingController();
  final confirmpassword = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // TODO: Implement login logic
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => bottom()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/spa1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.7),
          ),
          Positioned(
            top: 100.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 32.0),
                              TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: Colors.pink,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _email = value!;
                                // },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: phone,
                                decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: Colors.pink,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Phone';
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _password = value!;
                                // },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: _password,
                                decoration: InputDecoration(
                                  labelText: ' Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: Colors.pink,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your  Password';
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _password = value!;
                                // },
                              ),
                              SizedBox(height: 16.0),
                              TextFormField(
                                controller: confirmpassword,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                      color: Colors.pink,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Confirm Password';
                                  }
                                  return null;
                                },
                                // onSaved: (value) {
                                //   _password = value!;
                                // },
                              ),
                              SizedBox(height: 32.0),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _submitForm,
                                  child: Text('Sign Up'),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.pink.shade200,
                                      side: BorderSide.none,
                                      shape: StadiumBorder()),
                                ),
                              ),
                              SizedBox(height: 16.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      text: "Do You Have Account ? ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => SinginPage()),
                                      );
                                    },
                                    child: Text(
                                      "Sgin In",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.redAccent.withOpacity(0.1),
                                        elevation: 0,
                                        foregroundColor: Colors.red,
                                        shape: StadiumBorder(),
                                        side: BorderSide.none),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
