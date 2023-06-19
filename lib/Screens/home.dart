import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import 'Menu.dart';
import 'package:foodie/Api_Provider/Api_manager.dart';
import '../Model/FoodResponse.dart';
import '../Model/FoodResponse.dart';
import '../Model/FoodResponse.dart';
import '../controller/Food_Controller.dart';
import 'package:http/http.dart' as http;
import '../Widgets/drawer.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<FoodProduct> foodProduct = [];

  // final FoodController _foodController = Get.isRegistered()?Get.find():Get.put(FoodController());
  //  final ScrollController _scrollController = ScrollController();

  // final FoodController _foodController = FoodController();
  // List<Product> _products = [];
  String selectedLocation = 'gangapur Road';

   @override
  void initState() {
    super.initState();

  }



  void selectLocation() async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Location'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                selectedLocation = value;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, selectedLocation);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedLocation = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEEEEEE),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Color(0xFFEEEEEE),
          title: GestureDetector(
            //onTap: selectedLocation,
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8),
                Text(selectedLocation, style: TextStyle(color: Colors.black),),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle,),
              onPressed: () {
                // Handle account button pressed
              },
            ),
          ],

        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Container(
                      width: 280,
                      height: 45,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        // border: Border.all()
                      ),
                      child: Center(
                        child: TextField(
                          decoration: InputDecoration(
                              icon: new Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: "Search your favourite food"
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30),),
                      // border: Border.all()
                    ),

                    child: TextField(
                      decoration: InputDecoration(
                        iconColor: Colors.red,
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.filter_list),
                          onPressed: () {},),
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                splashColor: Colors.grey,
                onTap: () {

                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Positioned(
                        //height: 175,
                        //width: 327,
                        child: Image.asset('asset/images/Group 11.png'),
                      ),
                      Positioned(
                        top: 40,
                        left: 140,
                        height: 146,
                        width: 190,
                        child: Image.asset('asset/images/pedi.png'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories", style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600,),),
                    Text("View All", style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.red),)
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Image.asset('asset/images/Group13.png'),
                        Positioned(
                          bottom: 24,
                          left: 1,
                          right: 2,
                          child: InkWell(
                              onTap: () {
                                // Get.toNamed(MyRoutes.menuRoute);
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => Menu()));
                              },
                              child: Image.asset(
                                'asset/images/Biryani.png', height: 120,)),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset('asset/images/Group14.png'),
                        Positioned(
                          bottom: 24,
                          right: 1,
                          child: Image.asset('asset/images/fries.png',),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset('asset/images/Group15.png'),
                        Positioned(
                          bottom: 45,
                          right: 10,
                          child: Image.asset('asset/images/toco.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Popular today", style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600,),),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 152,
                width: 317,
                child: Image.asset('asset/images/Rectangle9.png'),
              ),
            ],
          ),
        ),

        drawer: DrawerWidget(),

        bottomNavigationBar: BottomNavigationBar(
          iconSize: 37,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.grey,
                icon: Icon(Icons.home_filled,
                    color: Colors.black),
                label: ""
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.favorite,
                  color: Colors.black,
                ),
                label: ""
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.discount,
                color: Colors.black,
              ),
              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: Colors.black
              ),
              label: '',
            ),
          ],
        ),
      );
  }
}
