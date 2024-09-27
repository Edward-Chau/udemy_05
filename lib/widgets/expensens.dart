import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/widgets/expensens_list/Expenses_list.dart';
import 'package:udemy05_expense_tracke_app/model/expenses.dart';
import 'package:udemy05_expense_tracke_app/widgets/expensens.dart';

class Expensens extends StatefulWidget {
  const Expensens({super.key});

  @override
  State<Expensens> createState() => _ExpensensState();
}

class _ExpensensState extends State<Expensens> {
//?List<Expenses>
//?list
  final List<Expenses> registeredExpenses = [
    Expenses(
        title: "cat",
        amount: 20.5,
        date: DateTime.now(),
        category: Category.work),
    Expenses(
        title: "cola",
        amount: 10.5,
        date: DateTime.now(),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expensens Tracker"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          const Text("The Chart"),
          Expanded(
            //?
            child: ExpensesList(expensesList: registeredExpenses),
          ),
          // ...registeredExpenses.map((item){return Text(((item.id)));})
        ],
      ),
    );
  }
}
