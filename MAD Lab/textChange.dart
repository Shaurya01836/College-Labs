import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TextButtonApp());
  }
}

class TextButtonApp extends StatefulWidget {
  @override
  _TextButtonAppState createState() => _TextButtonAppState();
}

class _TextButtonAppState extends State<TextButtonApp> {
  String msg = "Hello";

  void changeText() {
    setState(() {
      msg = "Button Clicked!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text & Button")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(msg, style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: changeText,
              child: Text("Click Me"),
            ),
          ],
        ),
      ),
    );
  }
}