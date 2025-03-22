import 'package:flutter/material.dart';

class ChargeInfoProvider extends ChangeNotifier {
  bool _isChargeHere = false;

  bool get isChargeHere => _isChargeHere;

  void toggleChargeStatus() {
    _isChargeHere = !_isChargeHere;
    notifyListeners();
  }

  void toggleUpdate() {
    _isChargeHere = false;
    notifyListeners();
  }

  void toggleStart() {
    _isChargeHere = true;
    notifyListeners();
  }

  bool _isStart = false;

  bool get isStart => _isStart;

  void toggleStartStops() {
    _isStart = true;
    notifyListeners();
  }
   void toggleStartStopsset() {
    _isStart = false;
    notifyListeners();
  }
}
