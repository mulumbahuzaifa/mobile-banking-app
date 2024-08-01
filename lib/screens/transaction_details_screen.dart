// lib/screens/transaction_details_screen.dart
import 'package:flutter/material.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;

  const TransactionDetailsScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaction Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: ${transaction['date']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Amount: \$${transaction['amount']}',
              style: TextStyle(
                  fontSize: 18,
                  color: transaction['amount'] < 0 ? Colors.red : Colors.green),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${transaction['description']}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
