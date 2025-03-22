import 'package:evdemoapp/model/charging_stations.dart';
import 'package:flutter/material.dart';

class ChargingStationProvider with ChangeNotifier {
  final List<ChargingStation> _stations = [
    ChargingStation(
        name: "Hôtel de Ville",
        address: "Pl. de l'Hôtel de Ville, Paris",
        distance: 1.4,
        pricePerHour: 28.00,
        type: "Type 2",
        power: 30,
        status: "Charging",
        image: 'assets/Photo (3).png',
        chargeId: "ChargerID-001"),
    ChargingStation(
      name: "Ober Mamma",
      address: "107 Bd Richard-Lenoir, Paris",
      distance: 1.4,
      pricePerHour: 26.00,
      type: "Type 2",
      power: 30,
      status: "Available",
      image: 'assets/Photo (4).png',
      chargeId: 'ChargerID-002',
    ),
  ];

  List<ChargingStation> get stations => _stations;

  void addStation(ChargingStation station) {
    _stations.add(station);
    notifyListeners();
  }
}
