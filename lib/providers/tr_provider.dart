import 'package:evdemoapp/model/tr_model.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  final List<TransactionModel> _transactions = [
    TransactionModel(
        amount: "€25.78",
        dateTime: "Today, 1:15 PM",
        kW: "8.12 kW",
        status: "Charging Session"),
    TransactionModel(
        amount: "€150.00",
        dateTime: "Today, 9:00 AM",
        kW: "8.12 kW",
        status: "Charging Session"),
    TransactionModel(
        amount: "€25.78",
        dateTime: "Today, 1:15 PM",
        kW: "8.12 kW",
        status: "Charging Session"),
    TransactionModel(
        amount: "€150.00",
        dateTime: "Today, 9:00 AM",
        kW: "8.12 kW",
        status: "Charging Session"),
  ];

  List<TransactionModel> get transactions => _transactions;
}
