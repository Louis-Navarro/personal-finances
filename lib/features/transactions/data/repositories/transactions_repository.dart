import 'package:personal_finance/features/transactions/data/datasources/local/app_database.dart';
import 'package:personal_finance/features/transactions/data/models/transaction.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';
import 'package:personal_finance/features/transactions/domain/repositories/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final AppDatabase _appDatabase;
  TransactionsRepositoryImpl(this._appDatabase);

  @override
  Future<void> addTransaction(TransactionEntity transaction) {
    return _appDatabase.transactionDao
        .addTransaction(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<void> deleteTransaction(TransactionEntity transaction) {
    return _appDatabase.transactionDao
        .deleteTransaction(TransactionModel.fromEntity(transaction));
  }

  @override
  Future<List<TransactionEntity>> getAllTransactions() {
    return _appDatabase.transactionDao.getAllTransactions();
  }

  @override
  Future<List<TransactionEntity>> getRecentTransactions(int count) {
    return _appDatabase.transactionDao.getRecentTransactions(count);
  }
}
