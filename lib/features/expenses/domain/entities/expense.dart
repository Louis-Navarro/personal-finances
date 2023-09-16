import 'package:equatable/equatable.dart';

class ExpenseEntity extends Equatable {
  final int? id;
  final int? amount;
  final String? category;
  final String? date;
  final String? description;

  const ExpenseEntity({
    this.id,
    this.amount,
    this.category,
    this.date,
    this.description,
  });

  @override
  List<Object?> get props => [amount, category, date, description];
}
