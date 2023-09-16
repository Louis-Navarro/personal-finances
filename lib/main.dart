import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/config/theme/app_theme.dart';
import 'package:personal_finance/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:personal_finance/features/transactions/presentation/pages/home/dashboard.dart';
import 'package:personal_finance/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (_) => sl<TransactionsBloc>()..add(const GetAllTransactions()),
      child: MaterialApp(
        theme: theme(),
        title: 'Personal finances',
        home: const Dashboard(),
      ),
    );
  }
}
