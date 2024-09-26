import 'package:flutter/material.dart';
import '../../model/expenses.dart';

class ExpenItem extends StatelessWidget {
  const ExpenItem(this.expensens, {super.key});
  final Expenses expensens;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(expensens.title),
                    Text("\$ ${expensens.amount.toStringAsFixed(2)}"),
                  ],
                ),
                const Spacer(),
                Icon(Icons.wallet),
                Text(
                  expensens.date.toString(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
