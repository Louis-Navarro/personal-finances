import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/features/expenses/domain/usecases/delete_expense.dart';
import 'package:personal_finance/features/expenses/domain/usecases/get_expense.dart';
import 'package:personal_finance/features/expenses/domain/usecases/save_expense.dart';
import 'package:personal_finance/features/expenses/presentation/bloc/expense/local/local_expense_event.dart';
import 'package:personal_finance/features/expenses/presentation/bloc/expense/local/local_expense_state.dart';

class LocalExpenseBloc extends Bloc<LocalExpenseEvent, LocalExpenseState> {
  final GetExpenseUseCase _getExpenseUseCase;
  final SaveExpenseUseCase _saveExpenseUseCase;
  final DeleteExpenseUseCase _deleteExpenseUseCase;

  LocalExpenseBloc(
    this._getExpenseUseCase,
    this._saveExpenseUseCase,
    this._deleteExpenseUseCase,
  ) : super(const LocalExpenseLoading()) {
    on<GetExpense>(onGetExpenses);
    on<DeleteExpense>(onDeleteExpense);
    on<SaveExpense>(onSaveExpense);
  }

  void onGetExpenses(
      GetExpense expense, Emitter<LocalExpenseState> emit) async {
    final expenses = await _getExpenseUseCase();
    emit(LocalExpenseDone(expenses));
  }

  void onDeleteExpense(
      DeleteExpense deleteExpense, Emitter<LocalExpenseState> emit) async {
    await _deleteExpenseUseCase(params: deleteExpense.expense);
    final expenses = await _getExpenseUseCase();
    emit(LocalExpenseDone(expenses));
  }

  void onSaveExpense(
      SaveExpense saveExpense, Emitter<LocalExpenseState> emit) async {
    await _saveExpenseUseCase(params: saveExpense.expense);
    final expenses = await _getExpenseUseCase();
    emit(LocalExpenseDone(expenses));
  }
}
