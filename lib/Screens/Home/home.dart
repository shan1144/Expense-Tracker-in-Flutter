import 'package:expense_tracker/Model/expenses.dart';
import 'package:expense_tracker/Screens/Home/displaylist.dart';
import 'package:expense_tracker/Screens/NewExpense/newexpense.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Expense> addedexpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 1500,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
      title: 'Java Course',
      amount: 1450,
      category: Category.work,
      date: DateTime.now(),
    ),
  ];

  void _openaddexpenseoverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(onAddExpense: addNewExpense));
  }

  void addNewExpense(Expense expense) {
    setState(() {
      addedexpenses.add(expense);
    });
  }

  void removeNewExpense(Expense expense) {
    final expenseIndex = addedexpenses.indexOf(expense);
    setState(() {
      addedexpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: const Text('expense deleted'),
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
              label: 'undo',
              onPressed: () {
                setState(() {
                  addedexpenses.insert(expenseIndex, expense);
                });
              })),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContant = const Center(
      child: Text("No Expenses"),
    );

    if (addedexpenses.isNotEmpty) {
      mainContant = DisplayList(
        addedexpenses: addedexpenses,
        onRemoveExpense: removeNewExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
              onPressed: _openaddexpenseoverlay, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(child: mainContant),
        ],
      ),
    );
  }
}
