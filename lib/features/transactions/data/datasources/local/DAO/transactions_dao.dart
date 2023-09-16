import 'package:floor/floor.dart';
import 'package:personal_finance/features/transactions/data/models/transaction.dart';

@dao
abstract class TransactionsDao {
  /// Get all transactions
  @Query('SELECT * FROM transactions ORDER BY date DESC')
  Future<List<TransactionModel>> getAllTransactions();

  /// Get *n* most recent transactions
  @Query('SELECT * FROM transactions ORDER BY date DESC, id DESC LIMIT :count')
  Future<List<TransactionModel>> getRecentTransactions(int count);

  /// Add a new transaction
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addTransaction(TransactionModel transaction);

  /// Delete a transaction
  @delete
  Future<void> deleteTransaction(TransactionModel transaction);
}
