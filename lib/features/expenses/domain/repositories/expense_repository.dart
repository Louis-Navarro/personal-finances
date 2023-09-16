import 'package:personal_finance/features/expenses/domain/entities/expense.dart';

abstract class ExpenseRepository {
  /// Returns all the expenses save in the database
  ///
  /// ```dart
  /// final expenses = await repository.getExpenses();
  /// print(expenses); // [ExpensesEntity, ExpensesEntity, ExpensesEntity]
  /// ```
  Future<List<ExpenseEntity>> getExpenses();

  /// Returns the n most recent expenses
  /// * n: The number of expenses to return
  ///
  /// ```dart
  /// final recentExpenses = await repository.getExpenses();
  /// print(recentExpenses); // [ExpensesEntity, ExpensesEntity, ExpensesEntity]
  /// ```
  Future<List<ExpenseEntity>> getRecentExpenses(int n);

  /// Saves an expense in the database
  Future<void> saveExpense(ExpenseEntity expense);

  /// Deletes an expense from the database
  Future<void> deleteExpense(ExpenseEntity expense);
}
