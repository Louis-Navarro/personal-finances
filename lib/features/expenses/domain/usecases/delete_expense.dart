import 'package:personal_finance/core/usecases/usecase.dart';
import 'package:personal_finance/features/expenses/domain/entities/expense.dart';
import 'package:personal_finance/features/expenses/domain/repositories/expense_repository.dart';

class DeleteExpenseUseCase implements UseCase<void, ExpenseEntity> {
  final ExpenseRepository _expenseRepository;
  DeleteExpenseUseCase(this._expenseRepository);

  @override
  Future<void> call({ExpenseEntity? params}) {
    return _expenseRepository.deleteExpense(params!);
  }
}
