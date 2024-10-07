import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/model/expenses.dart';

class ExpenOverlay extends StatefulWidget {
  const ExpenOverlay(this.onExpense, {super.key});

  final Function(Expenses item) onExpense; //?
  @override
  State<ExpenOverlay> createState() => _ExpenOverlayState();
}

class _ExpenOverlayState extends State<ExpenOverlay> {
  // String? enteredTitle;

  // saveTitleInput(String inputvalue) {
  //   enteredTitle = inputvalue;
  // }

  final titleController = TextEditingController(text: "test");
  final amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.food;

  void saveExpense() {
    final amountValue = double.tryParse(amountController.text);
    bool invalidAmount = (amountValue == null) || (amountValue <= 0);
    if (invalidAmount ||
        titleController.text.trim().isEmpty ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: const Icon(Icons.error_outline),
            title: const Text("Error"),
            content: const Text("plz enter value"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Okay"),
              ),
            ],
          );
        },
      );
    }
    widget.onExpense(
      Expenses(
          //?=>Expenses?
          title: titleController.text,
          amount: double.tryParse(amountController.text)!,
          date: selectedDate!,
          category: selectedCategory),
    );
  } //?

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void datePacker() async {
    final nowDate = DateTime.now();
    final pickDate = await showDatePicker(
      context: context,
      initialDate: nowDate,
      firstDate: DateTime(nowDate.year - 100),
      lastDate: DateTime(nowDate.year + 1),
    );
    setState(() {
      selectedDate = pickDate;
    });
  }

  // final List<String> test01 = ['ss', 'd', 'f'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          height: 6,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.send,
                      size: 20,
                    ),
                    labelText: "Tltle",
                    hintText: "input expense title"),
                maxLength: 50,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      keyboardType: const TextInputType.numberWithOptions(),
                      controller: amountController,
                      decoration: const InputDecoration(
                        label: Text("Amount"),
                        // hintText: "plz enter the price",
                        prefixIcon: Icon(
                          Icons.send,
                          size: 15,
                        ),
                        prefixText: '\$ ',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (selectedDate == null)
                          const Text('No seleced Date')
                        else
                          Text(
                            format.format(selectedDate!),
                          ),
                        IconButton(
                          onPressed: datePacker,
                          icon: const Icon(Icons.calendar_month),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  DropdownButton(
                    items: Category.values.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.name.toUpperCase(),
                        ),
                      );
                    }).toList(),
                    value: selectedCategory,
                    onChanged: (value) {
                      setState(
                        () {
                          if (value == null) {
                            return;
                          }
                          selectedCategory = value;
                        },
                      );
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: saveExpense
                    // onPressed: () {
                    //   print(titleController.text);
                    //   print(amountController.text);
                    //   print(selectedDate);
                    //   print(selectedCategory);
                    // },
                    ,
                    child: const Text("Save Expense"),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
