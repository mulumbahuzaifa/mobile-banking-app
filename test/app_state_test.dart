// test/app_state_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:banking_app/providers/app_state.dart';

void main() {
  group('AppState', () {
    late AppState appState;

    setUp(() {
      appState = AppState();
    });

    test('Initial balance should be 1000.0', () {
      final appState = AppState();
      expect(appState.balance, 1000.0);
    });

    test('Initial transactions are correct', () {
      expect(appState.transactions.length, 2);
    });

    test('Transfer funds should decrease balance', () {
      final appState = AppState();
      appState.transferFunds(100.0, 'Test Transfer');
      expect(appState.balance, 900.0);
      expect(appState.transactions.length, 1);
    });

    test('Logout should reset balance and transactions', () {
      final appState = AppState();
      appState.transferFunds(100.0, 'Test Transfer');
      appState.logout();
      expect(appState.balance, 1000.0);
      expect(appState.transactions.length, 0);
    });
  });
}
