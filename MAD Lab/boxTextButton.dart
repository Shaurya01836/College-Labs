import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SimpleUIApp());
  }
}

class SimpleUIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple UI")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome to MAD Lab"),
          SizedBox(height: 20),
          Container(height: 80, width: 150, color: Colors.orange),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: Text("Submit")),
        ],
      ),
    );
  }
}