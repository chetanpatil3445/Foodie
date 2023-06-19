import 'package:flutter/material.dart';
import 'package:foodie/Screens/Cart.dart';
import 'package:foodie/Screens/cart_page.dart';
import 'package:foodie/Screens/home.dart';
import 'package:foodie/routes.dart';
import 'package:foodie/Widgets/splash_screen.dart';
import 'Menu.dart';
import 'getstart_page.dart';
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
      initialRoute: MyRoutes.splashRoute,
      routes: {
        "/": (context)=>const Card1(),
        MyRoutes.getstartRoute:(context)=>const getstart(),
        MyRoutes.homeRoute:(context)=>const home(),
        MyRoutes.menuRoute:(context)=>const Menu(),
        MyRoutes.cart1Route:(context)=>const Card1(),
        MyRoutes.splashRoute:(context)=> SplashScreen(),
        MyRoutes.cartRoute:(context)=>const CartPage(),


      },
    );
  }
}
