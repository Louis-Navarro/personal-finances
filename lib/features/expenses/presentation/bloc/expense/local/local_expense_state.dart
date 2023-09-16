import 'package:equatable/equatable.dart';
import 'package:personal_finance/features/expenses/domain/entities/expense.dart';

abstract class LocalExpenseState extends Equatable {
  final List<ExpenseEntity>? expenses;
  const LocalExpenseState({this.expenses});

  @override
  List<Object?> get props => [expenses];
}

class LocalExpenseLoading extends LocalExpenseState {
  const LocalExpenseLoading();
}

class LocalExpenseDone extends LocalExpenseState {
  const LocalExpenseDone(List<ExpenseEntity> expenses)
      : super(expenses: expenses);
}
