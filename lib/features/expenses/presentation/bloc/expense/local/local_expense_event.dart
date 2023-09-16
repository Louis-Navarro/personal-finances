import 'package:equatable/equatable.dart';
import 'package:personal_finance/features/expenses/domain/entities/expense.dart';

abstract class LocalExpenseEvent extends Equatable {
  final ExpenseEntity? expense;

  const LocalExpenseEvent({this.expense});

  @override
  List<Object?> get props => [expense];
}

class GetExpense extends LocalExpenseEvent {
  const GetExpense();
}

class SaveExpense extends LocalExpenseEvent {
  const SaveExpense(ExpenseEntity expense) : super(expense: expense);
}

class DeleteExpense extends LocalExpenseEvent {
  const DeleteExpense(ExpenseEntity expense) : super(expense: expense);
}
