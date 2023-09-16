part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  final List<TransactionEntity>? transactions;
  const TransactionsState({this.transactions});

  @override
  List<Object?> get props => [transactions];
}

class TransactionsLoading extends TransactionsState {
  const TransactionsLoading() : super();
}

class TransactionsLoaded extends TransactionsState {
  const TransactionsLoaded(List<TransactionEntity> transactions)
      : super(transactions: transactions);
}
