import 'package:flutter/material.dart';
import 'package:udemy05_expense_tracke_app/widgets/expensens.dart';

void main() {
  // print(
  //   uuid.v4(), why can use here?
  // );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expensens(),
    ),
  );
}
