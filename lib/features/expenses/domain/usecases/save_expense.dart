import 'package:personal_finance/core/usecases/usecase.dart';
import 'package:personal_finance/features/expenses/domain/entities/expense.dart';
import 'package:personal_finance/features/expenses/domain/repositories/expense_repository.dart';

class SaveExpenseUseCase implements UseCase<void, ExpenseEntity> {
  final ExpenseRepository _expenseRepository;
  SaveExpenseUseCase(this._expenseRepository);

  @override
  Future<void> call({ExpenseEntity? params}) {
    return _expenseRepository.saveExpense(params!);
  }
}
