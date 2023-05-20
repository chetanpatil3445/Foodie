import 'package:flutter/material.dart';
import 'package:foodie/card1.dart';
import 'package:foodie/home.dart';
import 'package:foodie/routes.dart';
import 'getstart_page.dart';
import 'menu.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.cart1Route,
      routes: {
        "/": (context)=>const Card1(),
        MyRoutes.getstartRoute:(context)=>const getstart(),
        MyRoutes.homeRoute:(context)=>const home(),
        MyRoutes.menuRoute:(context)=>const Menu(),
        MyRoutes.cart1Route:(context)=>const Card1(),


      },
    );
  }
}
