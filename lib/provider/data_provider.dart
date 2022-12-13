import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int _car = 0;
  int _bus = 0;
  int _bicycle = 0;

  int get totalCar => _car;
  int get totalBus => _bus;
  int get totalBicycle => _bicycle;

  void addCar() {
    _car++;
    notifyListeners();
  }

  void minusCar() {
    _car > 0 ? _car-- : _car = 0;
    notifyListeners();
  }

  void addBus() {
    _bus++;
    notifyListeners();
  }

  void minusBus() {
    _bus > 0 ? _bus-- : _bus = 0;
    notifyListeners();
  }

  void addBicycle() {
    _bicycle++;
    notifyListeners();
  }

  void minusBicycle() {
    _bicycle > 0 ? _bicycle-- : _bicycle = 0;
    notifyListeners();
  }

  /// Removes all items from the cart.
  void cleanAll() {
    _car = 0;
    _bus = 0;
    _bicycle = 0;

    notifyListeners();
  }
}
