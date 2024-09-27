import 'package:flutter/material.dart';
import '../../model/expenses.dart';

class ExpenItem extends StatelessWidget {
  const ExpenItem(this.expensens, {super.key});
  final Expenses expensens;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expensens.title),
            Row(
              children: [
                Text(
                  "\$ ${expensens.amount.toStringAsFixed(2)}",
                ),
                const Spacer(),
                Icon(categoryIcon[expensens.category]),
                const SizedBox(
                  width: 5
                  ,
                ),
                Text(expensens.formatate)
              ],
            )
          ],
        ),
      ),
    );
  }
}
