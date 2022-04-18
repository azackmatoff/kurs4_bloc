import 'dart:developer';

import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _counter = 0;

  int get count => _counter;

  void increment() {
    _counter++;
    notifyListeners();

    log('HomeViewModel._counter..... $_counter');
  }
}
