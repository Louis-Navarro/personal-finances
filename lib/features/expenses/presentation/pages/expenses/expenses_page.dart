import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/features/expenses/presentation/bloc/expense/local/local_expense_bloc.dart';
import 'package:personal_finance/features/expenses/presentation/bloc/expense/local/local_expense_state.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Expenses',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalExpenseBloc, LocalExpenseState>(
      builder: (context, state) {
        if (state is LocalExpenseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LocalExpenseDone) {
          return ListView.builder(
            itemCount: state.expenses!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('$index'),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
