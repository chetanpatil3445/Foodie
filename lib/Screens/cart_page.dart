import 'package:flutter/material.dart';

import '../MenuScreens/Biryani_Menu.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFEEEEEE),
      appBar: AppBar(
        backgroundColor:Colors.grey.shade50 ,
        title: Text('Cart',style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BiryaniMenu()));
          },
        ),
      ),
      body: Column(
        children: [
          //Placeholder().p32().expand(),
          Divider(),
          _CartTotle(),
        ],
      ),
    );
  }
}

class  _CartTotle extends StatefulWidget {
  const  _CartTotle({Key? key}) : super(key: key);

  @override
  State< _CartTotle> createState() =>  _CartTotleState();
}

class  _CartTotleState extends State< _CartTotle> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        // Get the item details from the cartItems list
        String itemName = cartItems[index]['name'];
        String itemRating = cartItems[index]['rating'];
        String itemPrice = cartItems[index]['price'];

        // Display the item details in a ListTile or any other desired widget
        return Container(
          color: Colors.blue,
          height: 100,
          width: 100,
          child: ListTile(
            title: Text(itemName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemRating),
                Text(itemPrice),
              ],
            ),
          ),
        );
      },
    );;
  }
}

