import 'dart:developer';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt _counter = 0.obs;

  int get count => _counter.value;

  void increment() {
    _counter.value++;

    log('HomeController._counter..... ${_counter.value}');
  }
}
