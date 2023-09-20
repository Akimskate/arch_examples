import 'package:dio/dio.dart';

class DataRepository {
  Future<int?> fetchData() async {
    final dio = Dio();
    const url = 'https://pokeapi.co/';
    var response = await dio.get(url);

    if (response.statusCode == 200) {

      int? statusCode = response.statusCode;
      return statusCode;
    } else {
      return response.statusCode;
  }
    }
}