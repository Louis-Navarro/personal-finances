import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';

abstract class TransactionsRepository {
  /// Returns all the transactions save in the database
  ///
  /// ```dart
  /// final transactions = await repository.getAllTransactions();
  /// print(transactions); // [TransactionEntity, TransactionEntity, ...]
  /// ```
  Future<List<TransactionEntity>> getAllTransactions();

  /// Returns the *n* most recent transactions save in the database
  ///
  /// ```dart
  /// final recentTransactions = await repository.getRecentTransactions();
  /// print(recentTransactions); // [TransactionEntity, TransactionEntity, ...]
  /// ```
  Future<List<TransactionEntity>> getRecentTransactions(int count);

  /// Saves an expense in the database
  Future<void> addTransaction(TransactionEntity transaction);

  /// Deletes an expense from the database
  Future<void> deleteTransaction(TransactionEntity transaction);
}
