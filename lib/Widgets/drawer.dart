// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/Screens/getstart_page.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Screens/Menu.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: Text("Chetan Patil",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              decoration: BoxDecoration(
                  //color: Colors.green
                  color: Colors.grey,

            ),
              accountEmail: Text("patilc146@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("asset/images/user.png"),
                child: Text(""),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home,color: Colors.black,),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.person,color: Colors.black,),
            title: Text(
              "My Account",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.cart_fill,color: Colors.black),
            title: Text(
              "My Orders",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.heart_fill,color: Colors.black),
            title: Text(
              "My Wish List",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings,color: Colors.black),
            title: Text(
              "Setting",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,color: Colors.black),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => getstart()));
            },
            title: Text(
              "Log Out",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
