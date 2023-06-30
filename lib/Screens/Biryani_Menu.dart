import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import '../Api_provider/Db_helper.dart';
import '../Api_provider/cart_model.dart';
import '../Api_provider/cart_screen.dart';

class BiryaniMenu extends StatefulWidget {
  const BiryaniMenu({Key? key}) : super(key: key);

  @override
  _BiryaniMenuState createState() => _BiryaniMenuState();
}

class _BiryaniMenuState extends State<BiryaniMenu> {


  List<String> productName = ['Chicken' , 'Orange' , 'Grapes' , 'Banana' , 'Chery' , 'Peach','Mixed Fruit Basket',] ;
  List<String> productUnit = ['KG' , 'Dozen' , 'KG' , 'Dozen' , 'KG' , 'KG','KG',] ;
  List<int> productPrice = [10, 20 , 30 , 40 , 50, 60 , 70 ] ;
  List<String> productImage = [

    "asset/images/chicken.png",
    "asset/images/chicken.png",
    "asset/images/chicken.png",
    "asset/images/chicken.png",
    "asset/images/chicken.png",
    "asset/images/chicken.png",
    "asset/images/chicken.png",

  ] ;

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Center(
              child: badge.Badge(
                showBadge: true,
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value , child){
                    return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white));
                  },
                ),
                // animationType: BadgeAnimationType.fade,
                // animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_cart),
              ),
            ),
          ),

          SizedBox(width: 20.0)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                child: productImage[index].startsWith('http')
                                    ? Image.network(
                                  productImage[index],
                                  fit: BoxFit.cover,
                                )
                                    : Image.asset(
                                  productImage[index],
                                  fit: BoxFit.cover,
                                ),
                              ),

                              /* Image(
                                height: 100,
                                width: 100,
                                image: NetworkImage(productImage[index].toString()),
                              ),*/
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(productName[index].toString() ,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(productUnit[index].toString() +" "+r"$"+ productPrice[index].toString() ,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 5,),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: (){
                                          print(index);
                                          print(index);
                                          print(productName[index].toString());
                                          print( productPrice[index].toString());
                                          print( productPrice[index]);
                                          print('1');
                                          print(productUnit[index].toString());
                                          print(productImage[index].toString());

                                          dbHelper!.insert(
                                              Cart(
                                                  id: index,
                                                  productId: index.toString(),
                                                  productName: productName[index].toString(),
                                                  initialPrice: productPrice[index],
                                                  productPrice: productPrice[index],
                                                  quantity: 1,
                                                  unitTag: productUnit[index].toString(),
                                                  image: productImage[index].toString())
                                          ).then((value){

                                            cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                            cart.addCounter();

                                            final snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Product is added to cart'), duration: Duration(seconds: 1),);

                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                          }).onError((error, stackTrace){
                                            print("error"+error.toString());
                                            final snackBar = SnackBar(backgroundColor: Colors.red ,content: Text('Product is already added in cart'), duration: Duration(seconds: 1));

                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          });
                                        },
                                        child:  Container(
                                          height: 35,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(5)
                                          ),
                                          child: const Center(
                                            child:  Text('Add to cart' , style: TextStyle(color: Colors.white),),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )

                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}










/*
import 'package:flutter/material.dart';
import 'package:foodie/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Menu.dart';
import 'cart_page.dart';

class SectionMenu extends StatefulWidget {
  const SectionMenu({Key? key}) : super(key: key);

  @override
  State<SectionMenu> createState() => _SectionMenuState();
}

class _SectionMenuState extends State<SectionMenu> {
  List<Map<String, dynamic>> cartItems = [];

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
                                                              // Create a map to hold the item data and price
                                                              Map<String, dynamic> item = {
                                                                'name': "Chicken Dum Biryani",
                                                                'rating': "100 rating",
                                                                'price': "₹ 350",
                                                              };

                                                              // Add the item to the cart list
                                                              cartItems.add(item);

                                                              // Navigate to the cart page
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
*/


