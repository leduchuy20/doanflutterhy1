import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doan_flutter/accountinfo/editprofile/editprofileform.dart';
import 'package:doan_flutter/btnavigator/bottom.dart';
import 'package:doan_flutter/models/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  Products product;
  DetailPage({super.key, required this.product});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int _currentStep = 0;
  String _name = '';
  String _phoneNumber = '';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final _formKey = GlobalKey<FormState>();

  final user = FirebaseAuth.instance.currentUser!;
  final name = TextEditingController();
  final sdt = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    sdt.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Product Detail',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              widget.product.image,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              widget.product.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                widget.product.des,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price: ${widget.product.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return GestureDetector(
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                                child: Stepper(
                                  type: StepperType.horizontal,
                                  onStepTapped: (step) {
                                    setState(() {
                                      _currentStep = step;
                                    });
                                  },
                                  steps: [
                                    Step(
                                      title: Text('Họ Và Tên'),
                                      content: Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          // mainAxisSize: MainAxisSize.min,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  "Vui Lòng Nhập Họ và Tên"),
                                            ),
                                            TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  _name = value;
                                                });
                                              },
                                              controller: name,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter your Full Name';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                labelText: ' Full Name',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  borderSide: BorderSide(
                                                    color: Colors.pink,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      isActive: _currentStep >= 0,
                                    ),
                                    Step(
                                      title: Text('Số Điện Thoại'),
                                      content: Form(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                  "Vui Lòng Nhập Số Điện Thoại"),
                                            ),
                                            TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  _phoneNumber = value;
                                                });
                                              },
                                              controller: sdt,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Please enter your Phone Number';
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                labelText: 'Số Điện Thoại',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  borderSide: BorderSide(
                                                    color: Colors.pink,
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      isActive: _currentStep >= 1,
                                    ),
                                    Step(
                                      title: Text('Đặt Lịch'),
                                      content: Column(
                                        children: [
                                          ElevatedButton(
                                            // onPressed: () {},
                                            child: Text("Ngày: $_selectedDate"),
                                            onPressed: () async {
                                              final DateTime? picked =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate: _selectedDate,
                                                firstDate: _selectedDate,
                                                lastDate: DateTime(2100),
                                              );
                                              if (picked != null &&
                                                  picked != _selectedDate) {
                                                setState(() {
                                                  _selectedDate = picked;
                                                });
                                              }
                                            },
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                final TimeOfDay? picked =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime: _selectedTime,
                                                );
                                                if (picked != null &&
                                                    picked != _selectedTime) {
                                                  setState(() {
                                                    _selectedTime = picked;
                                                  });
                                                }
                                              },
                                              child: Text(
                                                  "Giờ: ${_selectedTime.format(context)}"))
                                          // SizedBox(height: 16),
                                          // if (_selectedDate != null)
                                          //   Text(
                                          //       'Selected date: $_selectedDate'),
                                        ],
                                      ),
                                      isActive: _currentStep >= 2,
                                    ),
                                  ],
                                  currentStep: _currentStep,
                                  onStepContinue: () {
                                    if (_formKey.currentState!.validate()) {
                                      // setState(() {
                                      //   switch (_currentStep) {
                                      //     case 0:
                                      //       _name;
                                      //       break;
                                      //     case 1:
                                      //       _phoneNumber;
                                      //       break;
                                      //   }
                                      // });
                                      if (_currentStep == 2) {
                                        print('Name: $_name');
                                        print('Phone number: $_phoneNumber');
                                        print('Selected date: $_selectedDate');
                                        print("time $_selectedTime");
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              child: AlertDialog(
                                                contentPadding:
                                                    EdgeInsets.all(50.0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                title:
                                                    Text('Xác nhận mua hàng'),
                                                content: SingleChildScrollView(
                                                  // reverse: true,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Text("Chào Anh/chị :"),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(_name),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          "Anh/ Chị xác nhận rằng đã book :"),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          widget.product.title),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text("Có già tiền là :"),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(widget.product.price
                                                          .toString()),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text("Vào ngày :"),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          "${_selectedDate} ${_selectedTime.format(context)}"),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                          "Với Số Điện Thoại Là:"),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(_phoneNumber)
                                                    ],
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('Hủy'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      DocumentReference docRef =
                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  "orders")
                                                              .add({
                                                        "proid":
                                                            widget.product.id,
                                                        "image": widget
                                                            .product.image,
                                                        "title": widget
                                                            .product.title,
                                                        "createday":
                                                            DateTime.now(),
                                                        "price": widget
                                                            .product.price,
                                                        "userid": user.uid,
                                                        // "fullname":
                                                        //     name.text.trim(),
                                                        "fullname": _name,
                                                        "sdt": _phoneNumber,
                                                        // "sdt": sdt.text.trim(),
                                                        "cateid": widget
                                                            .product.cateid,
                                                        "ngaydat":
                                                            _selectedDate,
                                                        "giodat": _selectedTime
                                                            .format(context),
                                                        // "id": document
                                                      });
                                                      String orderId =
                                                          docRef.id;
                                                      await docRef.set(
                                                          {"id": orderId},
                                                          SetOptions(
                                                              merge: true));
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              bottom(),
                                                        ),
                                                      );
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Đặt Lịch Thành Công",
                                                          gravity: ToastGravity
                                                              .BOTTOM);
                                                      // Thực hiện thao tác để đặt hàng
                                                    },
                                                    child: Text('Đặt Lịch'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        setState(() {
                                          _currentStep++;
                                        });
                                      }
                                    }
                                  },
                                  onStepCancel: () {
                                    setState(() {
                                      if (_currentStep > 0) {
                                        _currentStep--;
                                      } else {
                                        _currentStep = 0;
                                      }
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                      );
                      // showDialog(
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return Container(
                      //       // height: 2000,
                      //       // width: 300.0,
                      //       // height: 400.0,
                      //       child: AlertDialog(
                      //         // contentPadding: EdgeInsets.all(50.0),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(16.0),
                      //         ),
                      //         title: Text('Xác nhận mua hàng'),
                      //         content: SingleChildScrollView(
                      //           child: Column(
                      //             mainAxisSize: MainAxisSize.min,
                      //             // crossAxisAlignment: CrossAxisAlignment.stretch,
                      //             children: [
                      //               Image.asset(widget.product.image),
                      //               SizedBox(height: 16.0),
                      //               Text(widget.product.title),
                      //               SizedBox(height: 8.0),
                      //               Text('${widget.product.price} đ'),
                      //               SizedBox(height: 16.0),
                      //               inputformname(),
                      //               SizedBox(height: 8.0),
                      //               inputformsdt(),
                      //             ],
                      //           ),
                      //         ),
                      //         actions: [
                      //           TextButton(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //             child: Text('Hủy'),
                      //           ),
                      //           ElevatedButton(
                      //             onPressed: () async {
                      //               // Thực hiện hành động khi người dùng chạm vào nút Mua hàng
                      //               DocumentReference docRef =
                      //                   await FirebaseFirestore.instance
                      //                       .collection("orders")
                      //                       .add({
                      //                 "proid": widget.product.id,
                      //                 "image": widget.product.image,
                      //                 "title": widget.product.title,
                      //                 "date": DateTime.now(),
                      //                 "price": widget.product.price,
                      //                 "userid": user.uid,
                      //                 "fullname": name.text.trim(),
                      //                 "sdt": sdt.text.trim(),
                      //                 "cateid": widget.product.cateid
                      //               });
                      //               Navigator.push(
                      //                 context,
                      //                 MaterialPageRoute(
                      //                   builder: (context) => bottom(),
                      //                 ),
                      //               );
                      //               Fluttertoast.showToast(
                      //                   msg: "Đặt Lịch Thành Công",
                      //                   gravity: ToastGravity.BOTTOM);
                      //               // Thực hiện thao tác để đặt hàng
                      //             },
                      //             child: Text('Mua hàng'),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );
                    },
                    child: Container(
                      width: 70,
                      child: Center(
                        child: Text(
                          "Book",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.1),
                        elevation: 0,
                        foregroundColor: Colors.red,
                        shape: StadiumBorder(),
                        side: BorderSide.none),
                  )
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  TextFormField inputformsdt() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Phone Number ";
        }
        return null;
      },
      controller: sdt,
      decoration: InputDecoration(
        label: Text("Phone Number"),
        // prefixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
      ),
    );
  }

  TextFormField inputformname() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Name ";
        }
        return null;
      },
      controller: name,
      decoration: InputDecoration(
        label: Text("Full Name"),
        // prefixIcon: icon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.pink,
            width: 2,
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}
