import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/cart_provider.dart';
import '../Api_provider/Db_helper.dart';
import '../Api_provider/cart_model.dart';
import '../Screens/cart_screen.dart';

class PizzaMenu extends StatefulWidget {
  const PizzaMenu({Key? key}) : super(key: key);

  @override
  _PizzaMenuState createState() => _PizzaMenuState();
}

class _PizzaMenuState extends State<PizzaMenu> {


  List<String> productName = ['Cheese Overload Pizza' , 'Country Feast Pizza' , 'We Stuff Pizza' ,
    'Newton’s Pizza' , 'Newton’s Pizza' , 'Newton’s Pizza','Pizza Paradise',] ;
  List<String> productUnit = ['FOR 1' , 'FOR 1' , 'FOR 1' , 'FOR 1' , 'FOR 1' , 'FOR 1','FOR 1',] ;
  List<int> productPrice = [150, 140 , 200 , 299 , 259, 189 , 110 ] ;
  List<String> productImage = [

    "asset/images/pizza1.jpeg",
    "asset/images/pizza2.jpeg",
    "asset/images/pizza3.jpeg",
    "asset/images/pizza4.jpeg",
    "asset/images/pizza5.jpeg",
    "asset/images/pizza6.jpeg",
    "asset/images/pizza7.jpeg",
    "asset/images/pizza8.jpeg",


  ] ;

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('pizza menu'),
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
                                    Text(productUnit[index].toString() +" "+r"₹"+ productPrice[index].toString() ,
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