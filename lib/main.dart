import 'package:flutter/material.dart';
import 'package:foodie/Screens/home.dart';
import 'package:foodie/Screens/profile_Page.dart';
import 'package:foodie/routes.dart';
import 'package:foodie/Widgets/splash_screen.dart';
import 'package:provider/provider.dart';
import 'MenuScreens/Biryani_Menu.dart';
import 'MenuScreens/PizzaMenu.dart';
import 'Screens/UserProfilePage.dart';
import 'Screens/cart_screen.dart';
import 'Screens/Menu.dart';
import 'Screens/cart_provider.dart';
import 'Widgets/getstart_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: Builder(builder: (BuildContext context){
          return  MaterialApp(
        debugShowCheckedModeBanner: false,


        initialRoute: MyRoutes.splashRoute,
        routes: {
          "/": (context)=>const BiryaniMenu(),
          MyRoutes.getstartRoute:(context)=>const getstart(),
          MyRoutes.homeRoute:(context)=>const home(),
          MyRoutes.menuRoute:(context)=>const Menu(),
          MyRoutes.cart1Route:(context)=>const BiryaniMenu(),
          MyRoutes.splashRoute:(context)=> SplashScreen(),
          MyRoutes.ProfilePageRoute:(context)=>const ProfilePage(),
          MyRoutes.CartScreenRoute:(context)=>const CartScreen(),
          MyRoutes.ProductListScreenRoute:(context)=>const PizzaMenu(),
          MyRoutes.UserProfilePageRoute:(context)=>const UserProfilePage(),


        },
      );
        }),
    );
    }
  }

