import 'package:flutter/material.dart';

class ExpenOverlay extends StatefulWidget {
  const ExpenOverlay({super.key});

  @override
  State<ExpenOverlay> createState() => _ExpenOverlayState();
}

x() {}

class _ExpenOverlayState extends State<ExpenOverlay> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.send,size: 20,),
                labelText: "Tltle",
                hintText: "input expense title"),
            maxLength: 50,
          ),
          TextField(
            decoration: InputDecoration(
                label: Text("Amount"),
                hintText: "plz enter the price",
                prefixIcon: Icon(Icons.send,size: 15,),),
          ),
        ],
      ),
    );
  }
}
