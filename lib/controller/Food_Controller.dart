/*

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/FoodResponse.dart';


class FoodController {
  Future<List<Product>> fetchData() async {
    var url = Uri.parse('https://api.spoonacular.com/food/products/search?query=pizza&number=2');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Request was successful
      var data = response.body;
      var foodResponse = foodResponseFromJson(data);
      return foodResponse.products!;
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
      return [];
    }
  }
}
*/
