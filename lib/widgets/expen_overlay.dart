import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/model/expenses.dart';

class ExpenOverlay extends StatefulWidget {
  const ExpenOverlay({super.key});

  @override
  State<ExpenOverlay> createState() => _ExpenOverlayState();
}

class _ExpenOverlayState extends State<ExpenOverlay> {
  // String? enteredTitle;

  // saveTitleInput(String inputvalue) {
  //   enteredTitle = inputvalue;
  // }

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 6,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
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
                    Text(
                      selectedDate == null
                          ? 'No seleced Date'
                          : format.format(selectedDate!),
                    ),
                    //  Text(showDate()),
                    const SizedBox(
                      width: 5,
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
          const SizedBox(height: 30),
          Row(
            children: [
              DropdownButton(
                  value: Category.food,
                  items: items,
                  onChanged: (value) {}) //enum?

              ,
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(titleController.text);
                  print(amountController.text);
                  // print(pickDate);
                },
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }

  // String showDate(){
  //   final String showaDate;
  //   if(selectedDate==null){showDate='No seleced Date';}
  //   if(selectedDate!=null){}
  //   return showaDate;
  //   }
}
