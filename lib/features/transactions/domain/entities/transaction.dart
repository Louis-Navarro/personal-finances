import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final int? id;
  final int? amount;
  final String? date;
  final String? note;
  final String? category;

  const TransactionEntity({
    this.id,
    this.amount,
    this.date,
    this.note,
    this.category,
  });

  @override
  List<Object?> get props => [id, amount, date, note, category];
}
