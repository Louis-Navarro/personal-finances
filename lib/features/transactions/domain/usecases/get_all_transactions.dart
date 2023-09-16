import 'package:personal_finance/core/usecases/usecase.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';
import 'package:personal_finance/features/transactions/domain/repositories/transactions_repository.dart';

class GetAllTransactionsUseCase
    implements UseCase<List<TransactionEntity>, void> {
  final TransactionsRepository _transactionRepository;
  GetAllTransactionsUseCase(this._transactionRepository);

  /// Get all transactions
  @override
  Future<List<TransactionEntity>> call({void params}) {
    return _transactionRepository.getAllTransactions();
  }
}
