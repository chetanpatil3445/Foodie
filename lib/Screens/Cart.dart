import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Menu.dart';
import 'cart_page.dart';

class Card1 extends StatefulWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Color(0xFFEEEEEE),
        body:SingleChildScrollView(
          child: SafeArea(
            child: Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0 , right: 16 , top: 16),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)) ,
                            ),
                            child:  TextField(
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 suffixIcon: Icon(Icons.more_horiz  ),
                                 prefixIcon: GestureDetector(
                                   onTap: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                                     },
                                   child: Icon(
                                       Icons.arrow_back_ios,
                                   color: Colors.black),
                                 ),
                                 hintText: "Restaurant Name"),

                          ),),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0 , right: 16 , top: 16),
                    child: Container(
                        //color: Colors.white,
                      width: double.infinity,
                        height: 160,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset("asset/images/rename.png",),
                            Image.asset("asset/images/Group67.png", width: 100,)
                          ],
                        ),
                      )
                    ),
                  ),

                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 60,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                          ),
                          child: Center(child: Text("Veg",style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 15),
                          )
                          ),
                        ),
                       SizedBox(width: 5,),
                        Container(
                          child: Center(child: Text("Non Veg",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          )
                          ),
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5,),

                        Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                          ),
                          child: Center(child: Text("Bestseller",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                        ),
                        SizedBox(width: 5,),

                        Container(
                          width: 80,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white),
                            color: Colors.white,
                          ),
                          child: Center(child: Text("Rating 4.0+",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                 Container(
                      color: Colors.white,
                      height: 450,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: 100,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [

                                  Card(
                                    child: Container(
                                      height: 166,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                        Column(
                                         children: [
                                          SizedBox(height: 10,),
                                       //Text("Best In Biryani ",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                                            SizedBox(height: 10),
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                           Row(
                                           children: [
                                             Image.asset("asset/images/Vegetarian Food Symbol.png"  ),
                                             SizedBox(width: 5,),
                                             Image.asset("asset/images/Group70.png",
                                             ),
                                           ],
                                           ),
                                            SizedBox(height: 5,),
                                          Text("Chicken Dum Biryani",
                                            style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                                            SizedBox(height: 10,),
                                             Text("100 rating"),
                                           Text("₹ 350",style: TextStyle(color: Colors.red),),
                                          ],
                                          ),
                                         ],
                                        ),
                                        Container(height: 110,
                                          child: Stack(
                                            children: [Image.asset("asset/images/Rectangle36.png",),
                                             Positioned(
                                              top: 80,
                                               right: 10,
                                               child: InkWell(
                                               onTap: () {
                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                                                },
                                               child: Image.asset("asset/images/Group75.png")))
                                           ]),
                                         ),
                                       ]),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      height: 166,
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(height: 10,),
                                                //  Text("Best In Biryani ",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                                                SizedBox(height: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                        children: [
                                                          Image.asset("asset/images/Vegetarian Food Symbol.png"),
                                                          SizedBox(width: 5,),
                                                          Image.asset("asset/images/Group70.png"),]),
                                                    SizedBox(height: 5,),
                                                    Text("Chicken Biryani",
                                                      style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                                                    SizedBox(height: 10,),
                                                    Text("150 rating"),
                                                    Text("₹ 250",style: TextStyle(color: Colors.red),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(height: 110,
                                              child: Stack(
                                                  children: [Image.asset("asset/images/Rectangle37.png",),
                                                    Positioned(
                                                        top: 80,
                                                        right: 10,
                                                        child: InkWell(
                                                            onTap: () {
                                                              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                                                            },
                                                            child: Image.asset("asset/images/Group75.png"))),
                                                  ]),
                                            ),

                                          ]),
                                    ),
                                  ),
                                  Card(
                                    child: Container(
                                      height: 166,
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(height: 10,),
                                               // Text("Best In Biryani ",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                                                SizedBox(height: 10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                        children: [
                                                          Image.asset("asset/images/Vegetarian Food Symbol.png"),
                                                          SizedBox(width: 5,),
                                                          Image.asset("asset/images/Group70.png"),]),
                                                    SizedBox(height: 5,),
                                                    Text(" Special Chicken Biryani",
                                                      style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
                                                    SizedBox(height: 10,),
                                                    Text("110 rating"),
                                                    Text("₹ 300",style: TextStyle(color: Colors.red),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(height: 110,
                                              child: Stack(
                                                  children: [Image.asset("asset/images/Rectangle38.png",),
                                                    Positioned(
                                                        top: 80,
                                                        right: 10,
                                                        child: InkWell(
                                                            onTap: () {
                                                              Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
                                                            },
                                                            child: Image.asset("asset/images/Group75.png")))
                                                  ]),
                                            ),

                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },),
                    ),

                ],
              ),
            ),
          ),
        ),
    );
  }
}
