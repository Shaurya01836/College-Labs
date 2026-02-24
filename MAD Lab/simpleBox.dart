import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BoxApp());
  }
}

class BoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Box")),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Center(child: Text("Box", style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}