import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/model/expenses.dart';
import 'package:udemy05_expense_tracke_app/widgets/expensens_list/expen_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({required this.expensesList, super.key});

  final List<Expenses> expensesList;
  // final List<Expenses> registeredExpenses = [
  //   //index[0] Expenses(
  //       title: "cat",
  //       amount: 20.5,
  //       date: DateTime.now(),
  //       category: Category.work),
  //  //index[1] Expenses(
  //       title: "cola",
  //       amount: 10.5,
  //       date: DateTime.now(),
  //       category: Category.food),
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            color: Colors.red,
            child: const Row(
              children: [Spacer(),
                 Icon(Icons.cancel),SizedBox(width: 30,)
              ],
            ),
          ),
          key: ValueKey(
            expensesList[index],
          ),
          child: ExpenItem(
            expensesList[index],
          ),
        );
      },
    );
  }
}
