// TODO Implement this library.
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api_provider/Db_helper.dart';
import '../Api_provider/cart_model.dart';
class CartProvider with ChangeNotifier{

  DBHelper db = DBHelper() ;
  int _counter = 0 ;
  int get counter => _counter;

  double _totalPrice = 0.0 ;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart ;
  Future<List<Cart>> get cart => _cart ;
  Future<List<Cart>> getData () async {
    _cart = db.getCartList();
    return _cart ;
  }

  // Object getCartItems() {
  //   return db.getCartList();
  //   // Implement the logic to retrieve cart items from the data source
  //   // (e.g., database, API, etc.)
  //   // Return the cart items as a List<Cart>
  //
  //   // Example implementation:
  //   // return _cart; // Assuming _cart contains the cart items fetched from the data source
  //   return []; // Replace this line with your implementation
  // }
  Future<List<Cart>> getCartItems() {
    // Retrieve cart items from the database using the DBHelper class
    return db.getCartList();
  }

  void _setPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }


  void addTotalPrice (double productPrice){
    _totalPrice = _totalPrice +productPrice ;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalPrice (double productPrice){
    _totalPrice = _totalPrice  - productPrice ;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalPrice (){
    _getPrefItems();
    return  _totalPrice ;
  }


  void addCounter (){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removerCounter (){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter (){
    _getPrefItems();
    return  _counter ;

  }
}