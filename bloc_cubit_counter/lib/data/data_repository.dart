import 'package:http/http.dart' as http;

class DataRepository {
  Future<int> fetchData() async {
    final url = Uri.parse('https://pokeapi.co/');
    var response = await http.get(url);

    if (response.statusCode == 200) {

      int statusCode = response.statusCode;
      return statusCode;
    } else {
      return response.statusCode;
  }
    }
}