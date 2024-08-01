// test/app_state_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:banking_app/providers/app_state.dart';

void main() {
  group('AppState', () {
    late AppState appState;

    setUp(() {
      appState = AppState();
    });

    test('Initial balance is 1000', () {
      expect(appState.balance, 1000);
    });

    test('Initial transactions are correct', () {
      expect(appState.transactions.length, 2);
    });

    test('Transfer funds updates balance and transactions', () {
      appState.transferFunds(100, 'Test Transfer');
      expect(appState.balance, 900);
      expect(appState.transactions.length, 3);
    });

    test('Logout resets the state', () {
      appState.transferFunds(100, 'Test Transfer');
      appState.logout();
      expect(appState.balance, 1000);
      expect(appState.transactions.length, 2);
    });
  });
}
