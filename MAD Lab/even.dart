import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: EvenOddApp());
  }
}

class EvenOddApp extends StatefulWidget {
  @override
  _EvenOddAppState createState() => _EvenOddAppState();
}

class _EvenOddAppState extends State<EvenOddApp> {
  TextEditingController num = TextEditingController();
  String result = "";

  void check() {
    int n = int.parse(num.text);
    setState(() {
      result = (n % 2 == 0) ? "Even Number" : "Odd Number";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Even or Odd")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: num),
          ElevatedButton(onPressed: check, child: Text("CHECK")),
          Text(result),
        ],
      ),
    );
  }
}