import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';
import 'package:personal_finance/features/transactions/domain/usecases/add_transaction.dart';
import 'package:personal_finance/features/transactions/domain/usecases/delete_transaction.dart';
import 'package:personal_finance/features/transactions/domain/usecases/get_all_transactions.dart';
import 'package:personal_finance/features/transactions/domain/usecases/get_recent_transactions.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final GetAllTransactionsUseCase _getAllTransactionsUseCase;
  final GetRecentTransactionsUseCase _getRecentTransactionsUseCase;
  final AddTransactionUseCase _addTransactionUseCase;
  final DeleteTransactionUseCase _deleteTransactionUseCase;

  TransactionsBloc(
    this._getAllTransactionsUseCase,
    this._getRecentTransactionsUseCase,
    this._addTransactionUseCase,
    this._deleteTransactionUseCase,
  ) : super(const TransactionsLoading()) {
    on<GetAllTransactions>(onGetAllTransactions);
    on<GetRecentTransactions>(onGetRecentTransactions);
    on<AddTransaction>(onAddTransaction);
    on<DeleteTransaction>(onDeleteTransaction);
  }

  void onGetAllTransactions(
      GetAllTransactions transaction, Emitter<TransactionsState> emit) async {
    final expenses = await _getAllTransactionsUseCase();
    emit(TransactionsLoaded(expenses));
  }

  void onGetRecentTransactions(GetRecentTransactions transaction,
      Emitter<TransactionsState> emit) async {
    final transactions =
        await _getRecentTransactionsUseCase(params: transaction.count);
    emit(TransactionsLoaded(transactions));
  }

  void onAddTransaction(
      AddTransaction saveExpense, Emitter<TransactionsState> emit) async {
    await _addTransactionUseCase(params: saveExpense.transaction);
    final transactions = await _getAllTransactionsUseCase();
    emit(TransactionsLoaded(transactions));
  }

  void onDeleteTransaction(
      DeleteTransaction deleteExpense, Emitter<TransactionsState> emit) async {
    await _deleteTransactionUseCase(params: deleteExpense.transaction);
    final transactions = await _getAllTransactionsUseCase();
    emit(TransactionsLoaded(transactions));
  }
}
