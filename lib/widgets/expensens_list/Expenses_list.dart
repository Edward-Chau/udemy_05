import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/model/expenses.dart';
import 'package:udemy05_expense_tracke_app/widgets/expensens_list/expen_item.dart';

// class ExpensesList extends StatelessWidget {
//   const ExpensesList({required this.expensesList, super.key});

//   final List<Expenses> expensesList;
//   // final List<Expenses> registeredExpenses = [
//   //   //index[0] Expenses(
//   //       title: "cat",
//   //       amount: 20.5,
//   //       date: DateTime.now(),
//   //       category: Category.work),
//   //  //index[1] Expenses(
//   //       title: "cola",
//   //       amount: 10.5,
//   //       date: DateTime.now(),
//   //       category: Category.food),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: expensesList.length,
//       itemBuilder: (context, index) {
//         return Dismissible(onDismissed: (direction) {

//         },
//           background: Container(
//             color: Colors.red,
//             child: const Row(
//               children: [Spacer(),
//                  Icon(Icons.cancel),SizedBox(width: 30,)
//               ],
//             ),
//           ),
//           key: ValueKey(
//             expensesList[index],
//           ),
//           child: ExpenItem(
//             expensesList[index],
//           ),
//         );
//       },
// //     );
// //   }
// }

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {required this.expensesList,
      required this.undo,
      required this.deledExpense,
      super.key});
  final List<Expenses> expensesList;
  final Function(int, Expenses) undo; //(int, Expenses)need!
  final Function(int) deledExpense;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    if (widget.expensesList.isEmpty) {
      return const Center(
        child: Text("Add some Expense to List"),
      );
    } else {
      return ListView.builder(
        itemCount: widget.expensesList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              Expenses saveUndoElement = widget.expensesList[index];
              setState(
                () {
                  // widget.expensesList.removeAt(index);
                  widget.deledExpense(index);
                },
              );

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(Icons.error),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text("Expense Deleted!"),
                    ],
                  ),
                  action: SnackBarAction(
                    label: "Undo",
                    onPressed: () {
                      widget.undo(index, saveUndoElement);
                    },
                  ),
                ),
              );
            },
            secondaryBackground: Container(
              color: Colors.red,
              child: const Row(
                children: [
                  Spacer(),
                  Icon(Icons.cancel),
                  SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
            background: Container(
              color: Colors.red,
              child: const Row(
                children: [
                  SizedBox(width: 30),
                  Icon(Icons.cancel),
                  Spacer(),
                ],
              ),
            ),
            key: ValueKey(
              widget.expensesList[index],
            ),
            child: ExpenItem(
              widget.expensesList[index],
            ),
          );
        },
      );
    }
  }
}
