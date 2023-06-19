/*
import 'package:http/http.dart' as http;

void fetchData() async {
  var url = Uri.parse('https://api.spoonacular.com/food/products/search?query=pizza&number=2');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Request was successful
    var data = response.body;
    // Process the response data here
    print(data);
  } else {
    // Request failed
    print('Request failed with status: ${response.statusCode}');
  }
}
*/
