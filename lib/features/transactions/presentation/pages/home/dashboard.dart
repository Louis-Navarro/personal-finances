import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_finance/core/util/constants.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';
import 'package:personal_finance/features/transactions/presentation/bloc/transactions_bloc.dart';
import 'package:personal_finance/features/transactions/presentation/widgets/chart_widget.dart';
import 'package:personal_finance/features/transactions/presentation/widgets/information_widget.dart';
import 'package:personal_finance/features/transactions/presentation/widgets/update_transaction_widget.dart';
import 'package:personal_finance/features/transactions/presentation/widgets/transaction_widget.dart';
import 'package:personal_finance/features/transactions/presentation/widgets/transactions_header_widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
      titleTextStyle: Theme.of(context).textTheme.displayMedium,
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TransactionsLoaded) {
          int netIncome = 0;
          for (final transaction in state.transactions!) {
            netIncome += transaction.amount ?? 0;
          }

          return Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InformationWidget(
                        title: 'Net income',
                        value: '\$$netIncome',
                      ),
                      InformationWidget(
                        title: 'Number of transactions',
                        value: state.transactions!.length.toString(),
                      ),
                    ],
                  ),
                ),
                ChartWidget(state.transactions),
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.7,
                //   decoration: BoxDecoration(
                //     border: Border.all(color: Colors.black),
                //     borderRadius: const BorderRadius.all(
                //       Radius.circular(20),
                //     ),
                //   ),
                // ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TransactionsHeaderWidget(
                          title: 'Transactions history',
                          onAdd: () async {
                            final transaction = TransactionEntity(
                              id: null,
                              note: null,
                              amount: 0,
                              date: dateFormat.format(DateTime.now()),
                            );
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(35),
                                    ),
                                  ),
                                  child: TransactionUpdate(
                                    title: 'Update transaction',
                                    transaction: transaction,
                                    onUpdate: insertTransaction(context),
                                  ),
                                );
                              },
                            );
                          },
                          onDelete: () async {
                            for (final transaction in state.transactions!) {
                              BlocProvider.of<TransactionsBloc>(context)
                                  .add(DeleteTransaction(transaction));
                            }
                          },
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: min(
                              state.transactions!.length,
                              numberRecentTransactions,
                            ),
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final transaction = state.transactions![index];
                              return TransactionWidget(
                                transaction: transaction,
                                onUpdate: (TransactionEntity transaction) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35),
                                          ),
                                        ),
                                        child: TransactionUpdate(
                                          title: 'Update transaction',
                                          transaction: transaction,
                                          onUpdate: insertTransaction(context),
                                        ),
                                      );
                                    },
                                  );
                                },
                                onDelete: () async {
                                  BlocProvider.of<TransactionsBloc>(context)
                                      .add(DeleteTransaction(transaction));
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  void Function(TransactionEntity) insertTransaction(BuildContext context) {
    insert(TransactionEntity transaction) =>
        BlocProvider.of<TransactionsBloc>(context)
            .add(AddTransaction(transaction));

    return insert;
  }

  void Function(TransactionEntity) deleteTransaction(BuildContext context) {
    delete(TransactionEntity transaction) =>
        BlocProvider.of<TransactionsBloc>(context)
            .add(DeleteTransaction(transaction));

    return delete;
  }
}
