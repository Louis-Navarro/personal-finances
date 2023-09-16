part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  final TransactionEntity? transaction;
  const TransactionsEvent({this.transaction});

  @override
  List<Object?> get props => [transaction];
}

class GetAllTransactions extends TransactionsEvent {
  const GetAllTransactions();
}

class GetRecentTransactions extends TransactionsEvent {
  final int count;
  const GetRecentTransactions({required this.count});
}

class AddTransaction extends TransactionsEvent {
  const AddTransaction(TransactionEntity transaction)
      : super(transaction: transaction);
}

class DeleteTransaction extends TransactionsEvent {
  const DeleteTransaction(TransactionEntity transaction)
      : super(transaction: transaction);
}
