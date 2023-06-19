import 'package:flutter/material.dart';

import 'Cart.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => Card1()));
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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
