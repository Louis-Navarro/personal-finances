import 'package:flutter/material.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionEntity transaction;
  final void Function(TransactionEntity) onUpdate;
  final void Function() onDelete;

  const TransactionWidget({
    required this.onUpdate,
    required this.onDelete,
    required this.transaction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onUpdate(transaction),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(transaction.category ?? "Uncategorised"),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(transaction.date ?? ""),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.attach_money,
                            color: (transaction.amount ?? 0) < 0
                                ? Colors.red
                                : Colors.green),
                        Text(
                          '${transaction.amount}',
                          style: TextStyle(
                            fontSize: 20,
                            color: (transaction.amount ?? 0) < 0
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Text(transaction.note ?? "No note"),
                  ],
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: onDelete,
                    child: const Icon(Icons.delete),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
