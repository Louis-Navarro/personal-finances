import 'package:flutter/material.dart';
import 'package:personal_finance/core/util/constants.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';

class TransactionUpdate extends StatelessWidget {
  final TransactionEntity transaction;
  final String title;
  final void Function(TransactionEntity) onUpdate;

  final formKey = GlobalKey<FormState>();
  late final TextEditingController _dateController;
  late final TextEditingController _amountController;
  late final TextEditingController _noteController;
  late final TextEditingController _categoryController;

  TransactionUpdate({
    required this.title,
    this.transaction = const TransactionEntity(),
    required this.onUpdate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    _dateController = TextEditingController(
        text: transaction.date ?? dateFormat.format(DateTime.now()));
    _amountController =
        TextEditingController(text: (transaction.amount ?? 0).toString());
    _noteController = TextEditingController(text: transaction.note ?? '');
    _categoryController =
        TextEditingController(text: transaction.category ?? '');

    return Container(
      padding: const EdgeInsets.all(32.0),
      width: MediaQuery.of(context).size.width * .5,
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.displaySmall),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: _dateController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a date';
                }
                if (DateTime.tryParse(value) == null) {
                  return 'Please enter a valid date';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Date',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if ((value ?? "").isEmpty) {
                  return 'Amount is required';
                }
                if ((int.tryParse(value!) ?? -1) < 0) {
                  return "Amount must be a positive number";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Amount',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _noteController,
              decoration: const InputDecoration(
                labelText: 'Note',
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(
                labelText: 'Category',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  return;
                }
                final newTransaction = TransactionEntity(
                  id: transaction.id,
                  date: _dateController.text,
                  amount: int.tryParse(_amountController.text) ?? 0,
                  note: _noteController.text.isNotEmpty
                      ? _noteController.text
                      : 'No note',
                  category: _categoryController.text.isNotEmpty
                      ? _categoryController.text
                      : 'Miscellaneous',
                );
                onUpdate(newTransaction);
                Navigator.pop(context);
              },
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
