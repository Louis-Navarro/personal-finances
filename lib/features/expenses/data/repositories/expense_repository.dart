import 'package:personal_finance/features/expenses/data/datasources/local/app_database.dart';
import 'package:personal_finance/features/expenses/data/models/expense.dart';
import 'package:personal_finance/features/expenses/domain/entities/expense.dart';
import 'package:personal_finance/features/expenses/domain/repositories/expense_repository.dart';

class ExpenseRepositoryImpl implements ExpenseRepository {
  final AppDatabase _appDatabase;
  ExpenseRepositoryImpl(this._appDatabase);

  @override
  Future<List<ExpenseModel>> getExpenses() {
    return _appDatabase.expensesDao.getExpenses();
  }

  @override
  Future<List<ExpenseModel>> getRecentExpenses(int n) {
    return _appDatabase.expensesDao.getRecentExpenses(n);
  }

  @override
  Future<void> deleteExpense(ExpenseEntity expense) {
    return _appDatabase.expensesDao
        .deleteExpense(ExpenseModel.fromEntity(expense));
  }

  @override
  Future<void> saveExpense(ExpenseEntity expense) {
    return _appDatabase.expensesDao
        .insertExpense(ExpenseModel.fromEntity(expense));
  }
}
