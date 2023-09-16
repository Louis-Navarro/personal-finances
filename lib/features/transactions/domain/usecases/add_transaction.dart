import 'package:personal_finance/core/usecases/usecase.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';
import 'package:personal_finance/features/transactions/domain/repositories/transactions_repository.dart';

class AddTransactionUseCase implements UseCase<void, TransactionEntity> {
  final TransactionsRepository _transactionRepository;
  AddTransactionUseCase(this._transactionRepository);

  /// Get all transactions
  @override
  Future<void> call({TransactionEntity? params}) {
    return _transactionRepository.addTransaction(params!);
  }
}
