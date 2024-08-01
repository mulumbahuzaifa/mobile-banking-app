// lib/providers/app_state.dart
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  double _balance = 1000;
  List<Map<String, dynamic>> _transactions = [
    {'date': '2024-07-01', 'amount': -50, 'description': 'Grocery'},
    {'date': '2024-07-02', 'amount': 200, 'description': 'Salary'},
  ];

  double get balance => _balance;
  List<Map<String, dynamic>> get transactions => _transactions;

  void transferFunds(double amount, String description) {
    _balance -= amount;
    _transactions.add({
      'date': DateTime.now().toIso8601String().split('T')[0],
      'amount': -amount,
      'description': description,
    });
    notifyListeners();
  }

  void logout() {
    // Reset the state for demo purposes
    _balance = 1000;
    _transactions = [
      {'date': '2024-07-01', 'amount': -50, 'description': 'Grocery'},
      {'date': '2024-07-02', 'amount': 200, 'description': 'Salary'},
    ];
    notifyListeners();
  }
}
