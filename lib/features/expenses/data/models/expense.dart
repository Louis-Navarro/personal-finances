import 'package:floor/floor.dart';
import 'package:personal_finance/features/expenses/domain/entities/expense.dart';

@Entity(
  tableName: "expenses",
  primaryKeys: ["id"],
)
class ExpenseModel extends ExpenseEntity {
  const ExpenseModel({
    int? id,
    int? amount,
    String? category,
    String? date,
    String? description,
  }) : super(
            id: id,
            amount: amount,
            category: category,
            date: date,
            description: description);

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id']!,
      amount: json['amount'] ?? 0,
      category: json['category'] ?? '',
      date: json['date'] ?? '',
      description: json['description'] ?? '',
    );
  }

  factory ExpenseModel.fromEntity(ExpenseEntity entity) {
    return ExpenseModel(
      id: entity.id,
      amount: entity.amount,
      category: entity.category,
      date: entity.date,
      description: entity.description,
    );
  }
}
