import 'package:personal_finance/core/usecases/usecase.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';
import 'package:personal_finance/features/transactions/domain/repositories/transactions_repository.dart';

class DeleteTransactionUseCase implements UseCase<void, TransactionEntity> {
  final TransactionsRepository _transactionRepository;
  DeleteTransactionUseCase(this._transactionRepository);

  /// Get all transactions
  @override
  Future<void> call({TransactionEntity? params}) {
    return _transactionRepository.deleteTransaction(params!);
  }
}
