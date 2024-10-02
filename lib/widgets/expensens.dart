import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/widgets/expen_overlay.dart';
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

  // addToList(String titleController, String amountController,
  //     DateTime selectedDate, Category selectedCategory) {
  //   setState(
  //     () {
  //       registeredExpenses.add(
  //         Expenses(
  //             title: titleController,
  //             amount: double.tryParse(amountController)!,
  //             date: selectedDate,
  //             category: selectedCategory),
  //       );
  //     },
  //   );
  // }

  onAddExpense(Expenses item) {
    setState(
      () {
        registeredExpenses.add(item);
      },
    );
    Navigator.pop(context);
  } //?

  void openAddExpensenOverlay() {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return ExpenOverlay(onAddExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expensens Tracker"),
        actions: [
          IconButton(
            onPressed: openAddExpensenOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Text("The Chart"),
            Expanded(
              //?
              child: ExpensesList(expensesList: registeredExpenses),
            ),
            // ...registeredExpenses.map((item){return Text(((item.id)));})
          ],
        ),
      ),
    );
  }
}
