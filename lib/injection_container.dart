import 'package:get_it/get_it.dart';
import 'package:personal_finance/features/transactions/data/datasources/local/app_database.dart';
import 'package:personal_finance/features/transactions/data/repositories/transactions_repository.dart';
import 'package:personal_finance/features/transactions/domain/repositories/transactions_repository.dart';
import 'package:personal_finance/features/transactions/domain/usecases/add_transaction.dart';
import 'package:personal_finance/features/transactions/domain/usecases/delete_transaction.dart';
import 'package:personal_finance/features/transactions/domain/usecases/get_all_transactions.dart';
import 'package:personal_finance/features/transactions/domain/usecases/get_recent_transactions.dart';
import 'package:personal_finance/features/transactions/presentation/bloc/transactions_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Database
  final database =
      await $FloorAppDatabase.databaseBuilder('transactions.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Respository
  sl.registerSingleton<TransactionsRepository>(
      TransactionsRepositoryImpl(sl()));

  // UseCases
  sl.registerSingleton<GetAllTransactionsUseCase>(
      GetAllTransactionsUseCase(sl()));
  sl.registerSingleton<GetRecentTransactionsUseCase>(
      GetRecentTransactionsUseCase(sl()));
  sl.registerSingleton<AddTransactionUseCase>(AddTransactionUseCase(sl()));
  sl.registerSingleton<DeleteTransactionUseCase>(
      DeleteTransactionUseCase(sl()));

  // Blocs
  sl.registerFactory<TransactionsBloc>(
    () => TransactionsBloc(sl(), sl(), sl(), sl()),
  );
}
