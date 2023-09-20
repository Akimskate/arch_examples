import 'package:get/get.dart';
import 'package:getx_counter/data/data_repository.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  var statusCode = 0.obs;

  final dataRepository = DataRepository();

  incrementCounter() => counter.value++;

  decrementCounter() => counter.value--;

  resetCounter() => counter.value = 0;

  fetchStatusCode() async {
    try {
      final fetchedStatusCode = await dataRepository.fetchData();
      statusCode.value = fetchedStatusCode ?? 0;
    } catch (e) {
      rethrow;
    }
  }
}
