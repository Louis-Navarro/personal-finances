import 'package:personal_finance/core/usecases/usecase.dart';
import 'package:personal_finance/features/expenses/domain/entities/expense.dart';
import 'package:personal_finance/features/expenses/domain/repositories/expense_repository.dart';

class GetExpenseUseCase implements UseCase<List<ExpenseEntity>, void> {
  final ExpenseRepository _expenseRepository;
  GetExpenseUseCase(this._expenseRepository);

  @override
  Future<List<ExpenseEntity>> call({void params}) {
    return _expenseRepository.getExpenses();
  }
}
