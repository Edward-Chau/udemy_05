import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
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
          TextField(
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
          Row(
            children: [
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
                },
                child: const Text("Save Expense"),
              )
            ],
          )
        ],
      ),
    );
  }
}
