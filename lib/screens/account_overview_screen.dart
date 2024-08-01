// lib/screens/account_overview_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transfer_funds_screen.dart';
import 'profile_screen.dart';
import 'transaction_details_screen.dart';
import '../providers/app_state.dart';

class AccountOverviewScreen extends StatelessWidget {
  final String email;

  AccountOverviewScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Overview'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileScreen(email: email)),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<AppState>(
              builder: (context, appState, child) {
                return Text(
                  'Balance: \$${appState.balance.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Recent Transactions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Consumer<AppState>(
                builder: (context, appState, child) {
                  return ListView.builder(
                    itemCount: appState.transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = appState.transactions[index];
                      return ListTile(
                        title: Text(transaction['description']),
                        subtitle: Text(transaction['date']),
                        trailing: Text(
                          '\$${transaction['amount']}',
                          style: TextStyle(
                            color: transaction['amount'] < 0
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TransactionDetailsScreen(
                                  transaction: transaction),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransferFundsScreen(),
                ),
              ),
              child: Text('Transfer Funds'),
            ),
          ],
        ),
      ),
    );
  }
}
