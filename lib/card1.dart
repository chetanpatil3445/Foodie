import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Menu.dart';

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
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 329,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)) ,
                      ),
                      child:  TextField(
                       decoration: InputDecoration(
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
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: Stack(
                    children:[
                      Center(
                      child: Container(
                        child: Image.asset("asset/images/rename.png",),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white),
                        width: 329,
                        height: 146,
                      ),
                    ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Center(child: Text("Veg",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                        width: 60,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white),
                          color: Colors.white,
                        ),
                      ),
                     SizedBox(width: 5,),
                      Container(
                        child: Center(child: Text("Non Veg",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
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
                        child: Center(child: Text("Bestseller")),
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
                        child: Center(child: Text("Rating 4.0+")),
                      ),
                    ],
                  ),
                ),
               Container(
                    color: Colors.white,
                    height: 500,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: 100,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                height: 166,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                             Column(
                               children: [
                                 SizedBox(height: 10,),
                                 Text("Best In Biryani ",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
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
                             Text("Chicken Dum Biryani",style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
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

                                       },
                                         child: Image.asset("asset/images/Group75.png")))
                            ]),
                             ),

                         ]),
                              ),
                            ),
                          );
                        },),
                  ),

              ],
            ),
          ),
        ),
    );

  }
}
