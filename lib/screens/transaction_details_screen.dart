// lib/screens/transaction_details_screen.dart
import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;

  TransactionDetailsScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${transaction['date']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Amount: \$${transaction['amount']}',
              style: TextStyle(
                  fontSize: 18,
                  color: transaction['amount'] < 0 ? Colors.red : Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Description: ${transaction['description']}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
