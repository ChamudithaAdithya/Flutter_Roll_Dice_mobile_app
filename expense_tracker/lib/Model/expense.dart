import 'package:expense_tracker/expenses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final uuid = Uuid();
final dateFormatter = DateFormat.yMd();

enum Categories { food, leisure, travel, work }

final CategoriesIcons = {
  Categories.food: Icons.lunch_dining,
  Categories.leisure: Icons.movie,
  Categories.travel: Icons.flight_takeoff,
  Categories.work: Icons.work,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Enum categories;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.categories,
  }) : id = uuid.v4();

  String get formattedDate {
    return dateFormatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.categories, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.categories)
    : expenses = allExpenses
          .where((expense) => expense.categories == categories)
          .toList();

  final Categories categories;
  final List<Expense> expenses;

  double get totalExpenses {
    double total = 0;
    for (final expense in expenses) {
      total += expense.amount;
    }
    return total;
  }
}
