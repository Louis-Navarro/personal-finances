import 'package:floor/floor.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';

@Entity(tableName: 'transactions', primaryKeys: ['id'])
class TransactionModel extends TransactionEntity {
  const TransactionModel({
    int? id,
    int? amount,
    String? date,
    String? note,
    String? category,
  }) : super(
          id: id,
          amount: amount,
          date: date,
          note: note,
          category: category,
        );

  factory TransactionModel.fromEntity(TransactionEntity entity) =>
      TransactionModel(
        id: entity.id,
        amount: entity.amount,
        date: entity.date,
        note: entity.note,
        category: entity.category,
      );
}
