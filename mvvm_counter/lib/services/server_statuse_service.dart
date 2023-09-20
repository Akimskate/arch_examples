import 'package:http/http.dart' as http;
class ServerStatusService {

Future<bool> fetchServerStatus() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.codecademy.com/'),
      );
      if (response.statusCode == 200) {
        print(response.statusCode);
        return true;
      }
      return false;
    } catch (e) {
      throw false;
    }
  }
}