import 'package:personal_finance/core/usecases/usecase.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';
import 'package:personal_finance/features/transactions/domain/repositories/transactions_repository.dart';

class GetRecentTransactionsUseCase
    implements UseCase<List<TransactionEntity>, int> {
  final TransactionsRepository _transactionRepository;
  GetRecentTransactionsUseCase(this._transactionRepository);

  /// Get all transactions
  @override
  Future<List<TransactionEntity>> call({int? params}) {
    return _transactionRepository.getRecentTransactions(params!);
  }
}
