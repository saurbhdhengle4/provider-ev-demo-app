
import 'package:evdemoapp/model/session_model.dart';
import 'package:flutter/material.dart';

class ToggleProvider extends ChangeNotifier {
  bool isClubSelected = true;

  void selectClub() {
    isClubSelected = true;
    notifyListeners();
  }

  void selectGuest() {
    isClubSelected = false;
    notifyListeners();
  }
  List<ChargingSession> sessions = [
    ChargingSession(
      location: "Apart Hotel",
      power: "21 kW",
      secondaryPower: "8.12 kW",
      time: "Today, 1:15 PM",
      duration: "30 min",
    ),
    ChargingSession(
      location: "Glacis Charger 3",
      power: "8.12 kW",
      time: "Today, 9:00 AM",
      duration: "30 min",
    ),
    ChargingSession(
      location: "Hôtel de Ville",
      power: "8.12 kW",
      time: "Today, 9:00 AM",
      duration: "30 min",
    ),
  ];

  List<ChargingSession> sessionsNew = [
    ChargingSession(
      location: "Hôtel de Ville",
      power: "8.12 kW",
      time: "Today, 9:00 AM",
      duration: "30 min",
    ),
  ];
}
