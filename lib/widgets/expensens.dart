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
   
  Widget totalPrice(Category toElement) {
 double categoryPrice = 0;
    for (var i = 0; i < registeredExpenses.length; i++) {
      if (toElement == registeredExpenses[i].category) {
        categoryPrice = categoryPrice + registeredExpenses[i].amount;
      }
    }
    return Text("\$${categoryPrice.toString()}");
  }

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



//(listIndex, Expenses expenElement)need!
  void undo(listIndex, Expenses expenElement) {
    setState(
      () {
        registeredExpenses.insert(listIndex, expenElement);
       
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Widget mainContent = ExpensesList(expensesList: registeredExpenses);
    // if (registeredExpenses.isEmpty) {
    //   mainContent = const Center(
    //     child: Text("Add some Expense to List"),
    //   );
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.list_alt_outlined),
            SizedBox(
              width: 8,
            ),
            Text(
              "Expensens Tracker",
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: openAddExpensenOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                // color: Colors.deepOrange[400],
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrange[400]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...Category.values.map(
                      (toElement) {
                        return Column(
                          children: [
                            totalPrice(toElement),
                            Row(
                              children: [
                                Icon(categoryIcon[toElement]), //?
                                Text(toElement.name)
                              ],
                            )
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: ExpensesList(
                expensesList: registeredExpenses,
                undo: undo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
