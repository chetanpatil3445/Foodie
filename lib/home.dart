import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';

import 'Menu.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFEEEEEE),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                      border: Border.all()
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all()
                  ),

                  child: TextField(
                    decoration: InputDecoration(
                      iconColor: Colors.red,
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(Icons.filter_list),
                        onPressed: () {
                        },),
                    ),
                  ),
                )
              ],
            ),
          InkWell(
            splashColor: Colors.grey,
            onTap:  () {

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
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Categories",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,),),
                   Text("View All",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.red),)
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
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Menu()));
                           },
                           child: Image.asset('asset/images/Biryani.png',height: 120,)),
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
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular today",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600,),),
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

      drawer: const Drawer(),

      bottomNavigationBar: BottomNavigationBar(
        iconSize:37,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.grey,
            icon: Icon(Icons.home_filled ,
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
