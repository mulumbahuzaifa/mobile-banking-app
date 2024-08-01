// lib/screens/account_overview_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'transfer_funds_screen.dart';
import 'profile_screen.dart';
import 'transaction_details_screen.dart';
import '../providers/app_state.dart';

class AccountOverviewScreen extends StatelessWidget {
  final String email;

  const AccountOverviewScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Overview'),
        actions: [
          IconButton(
            // Profile icon
            icon: const Icon(Icons.person),
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
            // Display the user's balance
            Consumer<AppState>(
              builder: (context, appState, child) {
                return Text(
                  'Balance: \$${appState.balance.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            // Recent transactions
            const Text(
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
                          // Navigate to transaction details page when clicked
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransferFundsScreen(),
                ),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    const Color.fromARGB(255, 243, 75, 33), // foreground
              ),
              child: const Text('Transfer Funds'),
            ),
          ],
        ),
      ),
    );
  }
}
