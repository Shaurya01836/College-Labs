import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddNumbers(),
    );
  }
}

class AddNumbers extends StatefulWidget {
  @override
  _AddNumbersState createState() => _AddNumbersState();
}

class _AddNumbersState extends State<AddNumbers> {
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  String result = "";

  void add() {
    int a = int.parse(n1.text);
    int b = int.parse(n2.text);

    setState(() {
      result = "Sum = ${a + b}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple MAD Lab")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: n1),
          TextField(controller: n2),
          ElevatedButton(
            onPressed: add,
            child: Text("ADD"),
          ),
          Text(result),
        ],
      ),
    );
  }
}