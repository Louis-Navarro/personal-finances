import 'package:floor/floor.dart';
import 'package:personal_finance/features/expenses/data/datasources/local/DAO/expense_dao.dart';
import 'package:personal_finance/features/expenses/data/models/expense.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [ExpenseModel])
abstract class AppDatabase extends FloorDatabase {
  ExpenseDao get expensesDao;
}
