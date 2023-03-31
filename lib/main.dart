import 'package:device_preview/device_preview.dart';
import 'package:doan_flutter/btnavigator/bottom.dart';
import 'package:doan_flutter/cart/cartpage.dart';
import 'package:doan_flutter/favourite/favouritepage.dart';
import 'package:doan_flutter/search/search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'uidata.dart';
import 'onscreen/into_onscreen/intro.dart';
import 'home/home.dart';
import 'book/book.dart';
import 'onscreen/onscreen.dart';
import 'getallproduct/productpage.dart';
import 'getallproduct/productpage.dart';

void main() {
  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Device Preview
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      //Device Preview
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        textTheme: GoogleFonts.ubuntuTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: IntroPage(),
      home: OnScreen(),
      // home: bottom(),
      // home: ProductPage(),
      routes: <String, WidgetBuilder>{
        UIData.homePageRoute: (BuildContext context) => HomePage(),
        UIData.introPageRoute: (BuildContext context) => IntroPage(),
        UIData.bookPageRoute: (BuildContext context) => BookPage(),
        "/bottomhomepage": (context) => bottom(),
        "/getproduct": (BuildContext context) => const ProductPage(),
        "/cart": (context) => CartPage(),
        "/favourite": (context) => FavouritePage(),
        "/search": (context) => Search()
      },
    );
  }
}
