import 'package:floor/floor.dart';
import 'package:personal_finance/features/expenses/data/models/expense.dart';

@dao
abstract class ExpenseDao {
  @Insert()
  Future<void> insertExpense(ExpenseModel expense);

  @delete
  Future<void> deleteExpense(ExpenseModel expense);

  @Query('SELECT * FROM expenses ')
  Future<List<ExpenseModel>> getExpenses();

  @Query('SELECT * FROM expenses SORT BY date DESC LIMIT :n')
  Future<List<ExpenseModel>> getRecentExpenses(int n);
}
