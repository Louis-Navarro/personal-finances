import 'package:flutter/material.dart';

class TransactionsHeaderWidget extends StatelessWidget {
  final String title;
  final void Function() onAdd;
  final void Function() onDelete;

  const TransactionsHeaderWidget({
    required this.title,
    required this.onAdd,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildAddTransaction(),
        _buildClearTransactions(),
      ],
    );
  }

  Widget _buildAddTransaction() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onAdd,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(Icons.add),
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClearTransactions() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onDelete,
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.delete_forever_rounded),
          ],
        ),
      ),
    );
  }
}
