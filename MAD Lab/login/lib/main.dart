import 'package:flutter/material.dart';
import 'package:login/login.dart';
import 'package:login/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyLogin(),
      routes: {
        'register': (context) => const MyRegister(),
        'login': (context) => const MyLogin(),
      },
    );
  }
}
